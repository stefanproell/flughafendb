# Flughafen DB

The Flughafen DB repository containing a large MySQL data set for training, learning and testing.
Flughafen means airport in the German language.
We used an airport and flights related scenario for writing a German book for the Rheinwerk Verlag.
In the 800 pages book we used the data sets for describing MySQL concepts and the administration of MySQL servers.

The dataset is available in English and in German. A German description is available below.
There are two sets with the same schema but different amounts of data. 
The smaller set can be imported quickly, the larger one might take some time depending on your hardware.

# The FlughafenDB Dataset

## The smaller FlughafenDB dataset


| table    |              rows      |
|----------|:---------------------: |
| booking	               |3446513 |
| flight	               |302700  |
| flight_log	           |0       |
| airport	               |9939    |
| airport_reachable	       |0       |
| airport_geo	           |9854    |
| airline	               |113     |
| flightschedule	       |9851    |
| airplane	               |5583    |
| airplane_type	           |342     |
| employee	               |1000    |
| passenger	               |35386   |
| passengerdetails	       |36194   |
| weatherdata	           |4626432 |

## The larger FlughafenDB dataset


| table    |              rows          |
|----------|:-------------------------: |
|booking                    |50831531   |
|flight                     |416429     |
|flight_log                 |0          |
|airport                    |9939       |
|airport_reachable          |0          |
|airport_geo                |9854       |
|airline                    |113        |
|flightschedule             |9851       |
|airplane                   |5583       |
|airplane_type              |342        |
|employee                   |1000       |
|passenger                  |36346      |
|passengerdetails           |35785      |
|weatherdata                |4626432    |


## Importing

We user gzip to reduce the size of the datasets and split the larger set in smaller chunks.
You can use the following steps to load the dataset.

````
# Change to the directory with the zipped dump
cd english

# Concatenate the whole data set in one gzipped file 
cat flughafendb_large.sql.gz.part-* > flughafendb_large.sql.gz

# Create a new database in your MySQL instance
mysql -u your-user -h 127.0.0.1 -e "CREATE DATABASE flughafendb_large;"

# Import the dataset
zcat ./english/flughafendb_original_gross.sql.gz | mysql -u root -h 127.0.0.1 flughafendb_large

````

# Der FlughafenDB Datensatz

## Das kleinere Datenset: 

| Tabelle    |              Zeilen  |
|----------|:---------------------: |
| buchung	               |3446513 |
| flug	                   |302700  |
| flug_log	               |0       |
| flughafen	               |9939    |
| flughafen_erreichbar	   |0       |
| flughafen_geo	           |9854    |
| fluglinie	               |113     |
| flugplan	               |9851    |
| flugzeug	               |5583    |
| flugzeug_typ	           |342     |
| mitarbeiter	           |1000    |
| passagier	               |35386   |
| passagierdetails	       |36194   |
| wetterdaten	           |4626432 |

## Das große Datenset

| Tabelle    |              Zeilen      |
|----------|:-------------------------: |
|buchung                    |50831531   |
|flug                       |416429     |
|flug_log                   |0          |
|flughafen                  |9939       |
|flughafen_erreichbar       |0          |
|flughafen_geo              |9854       |
|fluglinie                  |113        |
|flugplan                   |9851       |
|flugzeug                   |5583       |
|flugzeug_typ               |342        |
|mitarbeiter                |1000       |
|passagier                  |36346      |
|passagierdetails           |35785      |
|wetterdaten                |4626432    |

# License

Flughafen DB by Stefan Proell, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. 
To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0

# Citation

FlughafenDB. (2015). Stefan Proell, Eva Zangerle, Wolfgang Gassler. www.flughafendb.cc. https://doi.org/10.5281/zenodo.3968361

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3968361.svg)](https://doi.org/10.5281/zenodo.3968361)

# Website

www.flughafendb.cc

# Warranty

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
