import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnilistService {
  static const String _url = 'https://graphql.anilist.co';

  static final Map<String, dynamic> _queries = {
    'carousel': '''
      query (\$page: Int, \$perPage: Int, \$search: String) {
        Page(page: \$page, perPage: \$perPage) {
          media(search: \$search, type: ANIME, sort: TRENDING_DESC) {
            id
            title {
              english
              romaji
              userPreferred
              native
            }
            startDate {
              year
              month
              day
            }
            trending
            popularity
            status
            duration
            description
            episodes
            coverImage {
              extraLarge
            }
            bannerImage
          }
        }
      }
    ''',
    'recent': '''
			query (\$page: Int, \$perPage: Int) {
				Page(page: \$page, perPage: \$perPage) {
					airingSchedules(notYetAired: false, sort: TIME_DESC) {
						id
						airingAt
						episode
						media {
							id
							title {
								romaji
								english
								userPreferred
								native
							}
							countryOfOrigin
							format
							duration
							genres
							description
							bannerImage
							coverImage {
								extraLarge
								large
							}
						}
					}
				}
			}
		''',
    'season': '''
			query (\$seasonYear: Int, \$season: MediaSeason, \$page: Int, \$perPage: Int, \$search: String) {
				Page(page: \$page, perPage: \$perPage) {
					media(search: \$search, seasonYear: \$seasonYear, season: \$season, isAdult: false, countryOfOrigin: JP, type: ANIME, sort: TRENDING_DESC) {
						id
						title {
							english
							romaji
							userPreferred
							native
						}
						format
						duration
						startDate {
							year
							month
							day
						}
						nextAiringEpisode {
							episode
							timeUntilAiring
						}
						episodes
						updatedAt
						description
						coverImage {
							large
							extraLarge
						}
						bannerImage
						averageScore
					}
				}
			}
		''',
    'find': '''
			query (\$page: Int, \$perPage: Int, \$search: String) {
				Page(page: \$page, perPage: \$perPage) {
					media(search: \$search, type: ANIME, sort: TRENDING_DESC) {
						id
						title {
							english
							romaji
							userPreferred
							native
						}
						startDate {
							year
						}
						format
						status
						episodes
						coverImage {
							large
						}
					}
				}
			}
		''',
    'details': '''
			query (\$id: Int) {
				Media(id: \$id) {
					id
					title {
						english
						romaji
						userPreferred
						native
					}
					startDate {
						year
						month
						day
					}
					season
					type
					format
					status
					episodes
					favourites
					synonyms
					relations {
						nodes {
							id
							type
							title {
								romaji
								english
							}
							coverImage {
								large
							}
						}
					}
					recommendations(page: 1, perPage: 6, sort: RATING_DESC) {
						nodes {
							mediaRecommendation {
								id
								title {
									romaji
									english
								}
								coverImage {
									large
								}
							}
						}
					}
					nextAiringEpisode {
						episode
					}
					duration
					genres
					averageScore
					description
					coverImage {
						extraLarge
					}
					bannerImage
				}
			}
		''',
    'watch': '''
			query (\$id: Int) {
				Media(id: \$id) {
					id
					title {
						english
						romaji
						userPreferred
						native
					}
					startDate {
						year
						month
						day
					}
					season
					type
					format
					status
					episodes
					favourites
					nextAiringEpisode {
						episode
					}
					duration
					genres
					averageScore
					description
					coverImage {
						extraLarge
					}
					bannerImage
				}
			}
		''',
    'schedule': '''
			query (\$page: Int, \$perPage: Int, \$airingAtGreater: Int, \$airingAtLesser: Int) {
				Page(page: \$page, perPage: \$perPage) {
					airingSchedules(airingAt_greater: \$airingAtGreater, airingAt_lesser: \$airingAtLesser,  sort: TIME) {
						id
						airingAt
						episode
						media {
							id
							title {
								romaji
								english
								userPreferred
								native
							}
							countryOfOrigin
							format
							duration
							genres
							description
							bannerImage
							coverImage {
								extraLarge
								large
							}
						}
					}
				}
			}
		''',
  };

  static Future<void> fetcher(
    String query,
    Map<String, dynamic> variables,
    Function callback,
  ) async {
    final build = variables['build'];
    variables.remove('build');

    final body = jsonEncode({
      'query': build != null ? _queries[query](build) : _queries[query],
      'variables': variables,
    });
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(
      Uri.parse(_url),
      headers: headers,
      body: body,
    );
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    debugPrint(jsonEncode(decodedResponse));
  }
}
