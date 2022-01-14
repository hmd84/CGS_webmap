import folium
import geopandas as gpd
import cx_Oracle

#Generate dataframe from shapefile

quint_df = gpd.GeoDataFrame.from_file('quintiles.shp')



#create folium map

frame = folium.Figure(width=1050, height=750)

map_ = folium.Map(location=[55.92,-3.20], zoom_start=11,
                      tiles=None, crs='EPSG3857', 
                      control_scale=True, attributionControl=False, 
                      min_zoom=2, min_lot=-179,
                      max_lot=179, min_lat=-65, 
                      max_lat=179, max_bounds=True).add_to(frame)

#add basemap tile layers

folium.TileLayer('cartodbpositron', name="light mode", control=True).add_to(map_)
folium.TileLayer('cartodbdark_matter', name="dark mode", control=True).add_to(map_)

#create feature group for Parks layer and add to map

f2 = folium.FeatureGroup(name="Edinburgh Parks").add_to(map_)


#Create choropleth layers from dataframe 


simd_choro = folium.Choropleth(
    geo_data=quint_df,
    name='SIMD rankings',
    data=quint_df,
    columns=['DataZone','RANK'],
    key_on="feature.properties.DataZone",
    #Threshold_scale=[1,2,3,4,5],
    fill_color= 'RdYlBu',
    fill_opacity=0.9,
    line_opacity=0.2,
    legend_name='SIMD rank/DataZone',
    smooth_factor=0
).add_to(map_)

style_function = lambda x: {'fillColor': '#ffffff', 
                            'color':'#000000', 
                            'fillOpacity': 0.1, 
                            'weight': 0.1}
highlight_function = lambda x: {'fillColor': '#000000', 
                                'color':'#000000', 
                                'fillOpacity': 0.50, 
                                'weight': 0.1}

for i in range(len(quint_df)):
    row = quint_df.loc[[i]]
    feature = folium.features.GeoJson(
        row,
        style_function=style_function,
        control=False,
        highlight_function=highlight_function,
        tooltip=folium.features.GeoJsonTooltip(
            fields=[
                'DataZone',
                'DZName',
                'SIMD_QUANT',
                'RANK',  
            ],
            aliases=[
                'DataZone: ',
                'Area: ',
                'SIMD quantile: ',
                'SIMD rank: ',
                    
            ],
            labels=True,
            sticky=False,
            localize=True,
            style=("background-color: white; color: #333333; font-family: arial; font-size: 12px; padding: 10px;")
        )
    ).add_to(simd_choro)
    
   
edm_choro = folium.Choropleth(
    geo_data=quint_df,
    name='Cultural and Historical Heritage',
    data=quint_df,
    columns=['DataZone','CHI_QUINT'],
    key_on="feature.properties.DataZone",
    fill_color= 'Purples',
    fill_opacity=0.9,
    line_opacity=0.2,
    legend_name='Cultural and Historical Index',
    smooth_factor=0
).add_to(map_)

style_function = lambda x: {'fillColor': '#ffffff', 
                            'color':'#000000', 
                            'fillOpacity': 0.1, 
                            'weight': 0.1}
highlight_function = lambda x: {'fillColor': '#000000', 
                                'color':'#000000', 
                                'fillOpacity': 0.50, 
                                'weight': 0.1}

for i in range(len(quint_df)):
    row = quint_df.loc[[i]]
    feature = folium.features.GeoJson(
        row,
        style_function=style_function,
        control=False,
        highlight_function=highlight_function,
        tooltip=folium.features.GeoJsonTooltip(
            fields=[
                'DataZone',
                'DZName',
                'COMM_QUINT',
                'CHI_QUINT',
                'GREENSPACE',
                'GREENSPA_1',  
            ],
            aliases=[
                'DataZone: ',
                'Area: ',
                'Community Space Access: ',
                'CHI score: ',
                'Greenspace Quality Score (Greenflag 2019): ',
                'Greenspace Access Score: ',
                    
            ],
            labels=True,
            sticky=False,
            localize=True,
            style=("background-color: white; color: #333333; font-family: arial; font-size: 12px; padding: 10px;")
        )
    ).add_to(edm_choro)



#convert parks shapefie to GeoJSON and add to feature group

parks_df = gpd.GeoDataFrame.from_file('parks_poly.shp')
parks_df.to_file("parks.geojson", driver="GeoJSON")
parks_gjs = "parks.geojson"

style = lambda x: {'fillColor': '#009933',
                   'color': '#003311',
                   'weight': 1,
                   'fillOpacity': 1
}
#add tooltip function to parks feature group

folium.GeoJson(parks_gjs, name="Edinburgh Parks", style_function=style,
               tooltip=folium.GeoJsonTooltip(fields=['NAME'], style = ("background-color:white; color: #333333; font-family: arial; font-size 12px; padding: 10px;"),sticky = True, show=False)).add_to(f2)



#connect oracle database to parks featuregroup



with open("oracle", 'r') as pwf:
    pwd = pwf.read().strip()

conn = cx_Oracle.connect(user="s2126572", password=pwd)
c = conn.cursor()
c.execute("SELECT * from parks")
                         
for row in c:
    folium.Marker([row[4],row[3]], tooltip=('classification:', row[1], 'POST rank:', row[2]), icon=folium.Icon(color='green', icon='leaf', prefix='fa'), show=False).add_to(f2)


conn.close()

folium.LayerControl().add_to(map_)

#save output to html file              
map_.save("public_html/choropleth.html")




