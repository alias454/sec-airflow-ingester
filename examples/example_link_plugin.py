# This is the class you derive to create a plugin
from airflow.plugins_manager import AirflowPlugin

# Creating flask appbuilder Menu Items
menu_item_toplevel = {
    "name": "Apache",
    "href": "https://www.apache.org/"
}

menu_item = {
    "name": "Sec-Airflow",
    "href": "https://github.com/alias454/sec-airflow-ingester",
    "category": "Resources"
}


# Defining the plugin class
class AirflowLinksPlugin(AirflowPlugin):
    name = "links_plugin"
    appbuilder_menu_items = [
        menu_item_toplevel,
        menu_item
    ]