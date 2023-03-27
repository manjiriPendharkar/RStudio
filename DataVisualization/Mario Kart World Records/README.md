## Visualising Mario Kart World Records 

#### It’s about Mario Kart World Records and contains world records for the classic racing game on the Nintendo 64.
The records are saved in the records.csv file and contain the following variables:
|variable        |class     |description                     |
|----------------|----------|--------------------------------|
|track           |character | Track name                     |
|type            |factor    |Single or three lap record      |
|shortcut        |factor    |Shortcut or non-shortcut record |
|player          |character |Player’s name                   |
|system_played   |character |Used system (NTSC or PAL)       |
|date            |date      |World record date               |
|time_period     |period    |Time as ‘hms‘ period            |
|time            |double    |Time in seconds                 |
|record_duration |double    |Record duration in days         |


The game consists of 16 individual tracks, and world records can be achieved for the fastest single lap or the fastest completed race (for three laps). Also, through the years, players discovered shortcuts in many of the tracks. Fortunately, shortcut and non-shortcut world records are listed separately.
Furthermore, the Nintendo 64 was released for NTSC- and PAL-systems. On PAL-systems, the game runs a little slower at 25 frames per second. All times in this dataset are PAL-times, but they can be converted back to NTSC-times
