//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSTranscribeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranscribeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranscribeResources

+ (instancetype)sharedInstance {
    static AWSTranscribeResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTranscribeResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-10-26\",\
    \"endpointPrefix\":\"transcribe\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Transcribe Service\",\
    \"serviceId\":\"Transcribe\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"transcribe\",\
    \"targetPrefix\":\"Transcribe\",\
    \"uid\":\"transcribe-2017-10-26\"\
  },\
  \"operations\":{\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary that you can use to change the way Amazon Transcribe handles transcription of an audio file. </p>\"\
    },\
    \"DeleteTranscriptionJob\":{\
      \"name\":\"DeleteTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a previously submitted transcription job along with any other generated results such as the transcription, models, and so on.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a vocabulary from Amazon Transcribe. </p>\"\
    },\
    \"GetTranscriptionJob\":{\
      \"name\":\"GetTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a transcription job. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptionFileUri</code> field.</p>\"\
    },\
    \"GetVocabulary\":{\
      \"name\":\"GetVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a vocabulary. </p>\"\
    },\
    \"ListTranscriptionJobs\":{\
      \"name\":\"ListTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists transcription jobs with the specified status.</p>\"\
    },\
    \"ListVocabularies\":{\
      \"name\":\"ListVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.</p>\"\
    },\
    \"StartTranscriptionJob\":{\
      \"name\":\"StartTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous job to transcribe speech to text. </p>\"\
    },\
    \"UpdateVocabulary\":{\
      \"name\":\"UpdateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing vocabulary with new values. The <code>UpdateVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request. </p>\"\
    }\
  },\
  \"shapes\":{\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Your request didn't pass one or more validation tests. For example, if the transcription you're trying to delete doesn't exist or if it is in a non-terminal state (for example, it's \\\"in progress\\\"). See the exception <code>Message</code> field for more information.</p>\",\
      \"exception\":true\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>When you are using the <code>StartTranscriptionJob</code> operation, the <code>JobName</code> field is a duplicate of a previously entered job name. Resend your request with a different name.</p> <p>When you are using the <code>UpdateVocabulary</code> operation, there are two jobs running at the same time. Resend the second request later.</p>\",\
      \"exception\":true\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary. The name must be unique within an AWS account. The name is case-sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings that contains the vocabulary entries. </p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p> <p> <code> https://s3-&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>https://s3-us-east-1.amazonaws.com/examplebucket/vocab.txt</code> </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary\\\">Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was created.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        }\
      }\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job to be deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to delete. </p>\"\
        }\
      }\
    },\
    \"FailureReason\":{\"type\":\"string\"},\
    \"GetTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object that contains the results of the transcription job.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return information about. The name is case-sensitive.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the vocabulary is stored. Use this URI to get the contents of the vocabulary. The URI is available for a limited time.</p>\"\
        }\
      }\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There was an internal error. Check the error message and try your request again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en-US\",\
        \"es-US\",\
        \"en-AU\",\
        \"fr-CA\",\
        \"en-GB\",\
        \"de-DE\",\
        \"pt-BR\",\
        \"fr-FR\",\
        \"it-IT\",\
        \"ko-KR\",\
        \"es-ES\",\
        \"en-IN\",\
        \"hi-IN\",\
        \"ar-SA\"\
      ]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Either you have sent too many requests or your input file is too long. Wait before you resend your request, or use a smaller file and resend the request.</p>\",\
      \"exception\":true\
    },\
    \"ListTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>When specified, returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you donât specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date. </p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListTranscriptionJobs</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested status of the jobs returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListTranscriptionJobs</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"TranscriptionJobSummaries\":{\
          \"shape\":\"TranscriptionJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of vocabularies to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>When specified, only returns vocabularies with the <code>VocabularyState</code> field equal to the specified state.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is case-insensitive, <code>ListVocabularies</code> will return both \\\"vocabularyname\\\" and \\\"VocabularyName\\\" in the response list.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested vocabulary state.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularies</code> operation returns a page of vocabularies at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularies</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>A list of objects that describe the vocabularies that match the search criteria in the request.</p>\"\
        }\
      }\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxSpeakers\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"Media\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p> <p> <code> https://s3-&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>https://s3-us-east-1.amazonaws.com/examplebucket/example.mp4</code> </p> <p> <code>https://s3-us-east-1.amazonaws.com/examplebucket/mediadocs/example.mp4</code> </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the input media file in a transcription request.</p>\"\
    },\
    \"MediaFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"mp3\",\
        \"mp4\",\
        \"wav\",\
        \"flac\"\
      ]\
    },\
    \"MediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":8000\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":8192\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>We can't find the requested resource. Check the name and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"OutputBucketName\":{\
      \"type\":\"string\",\
      \"pattern\":\"[a-z0-9][\\\\.\\\\-a-z0-9]{1,61}[a-z0-9]\"\
    },\
    \"OutputLocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CUSTOMER_BUCKET\",\
        \"SERVICE_BUCKET\"\
      ]\
    },\
    \"Phrase\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"Phrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Phrase\"}\
    },\
    \"Settings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of a vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels <code>MaxSpeakerLabels</code> field.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers will be identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Instructs Amazon Transcribe to process each audio channel separately and then merge the transcription output of each channel into a single transcription. </p> <p>Amazon Transcribe also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of the item including the confidence that Amazon Transcribe has in the transcription.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>\"\
    },\
    \"StartTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptionJobName\",\
        \"LanguageCode\",\
        \"MediaFormat\",\
        \"Media\"\
      ],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job. Note that you can't use the strings \\\".\\\" or \\\"..\\\" by themselves as the job name. The name must also be unique within an AWS account.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language used in the input media file.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for a transcription job.</p>\"\
        },\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The location where the transcription is stored.</p> <p>If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the transcription in the specified S3 bucket. When you call the <a>GetTranscriptionJob</a> operation, the operation returns this location in the <code>TranscriptFileUri</code> field. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/access-control-managing-permissions.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p> <p>Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket. You can't specify your own encryption key.</p> <p>If you don't set the <code>OutputBucketName</code>, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the <code>TranscriptFileUri</code> field. Use this URL to download the transcription.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object containing details of the asynchronous transcription job.</p>\"\
        }\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Transcript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The location where the transcription is stored.</p> <p>Use this URI to access the transcription. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcription in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the location of a transcription.</p>\"\
    },\
    \"TranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for the transcription job.</p>\"\
        },\
        \"Transcript\":{\
          \"shape\":\"Transcript\",\
          \"documentation\":\"<p>An object that describes the output of the transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p> <p>The <code>FailureReason</code> field can contain one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code> - The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code> - The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code> - The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8000 and 48000 Hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code> - The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid file size: file size too large</code> - The size of your audio file is larger than Amazon Transcribe can process. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Limits</a> in the <i>Amazon Transcribe Developer Guide</i>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code> - Your audio contains more channels than Amazon Transcribe is configured to process. To request additional channels, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe\\\">Amazon Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.</p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>Optional settings for the transcription job. Use these settings to turn on speaker recognition, to set the maximum number of speakers that should be identified and to specify a custom vocabulary to use when processing the transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation. </p>\"\
    },\
    \"TranscriptionJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"TranscriptionJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"TranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TranscriptionJobSummary\"}\
    },\
    \"TranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job. When the status is <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation to get the results of the transcription.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates the location of the output of the transcription job.</p> <p>If the value is <code>CUSTOMER_BUCKET</code> then the location is the S3 bucket specified in the <code>outputBucketName</code> field when the transcription job was started with the <code>StartTranscriptionJob</code> operation.</p> <p>If the value is <code>SERVICE_BUCKET</code> then the output is stored by Amazon Transcribe and can be retrieved using the URI in the <code>GetTranscriptionJob</code> response's <code>TranscriptFileUri</code> field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of information about a transcription job. .</p>\"\
    },\
    \"UpdateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to update. The name is case-sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings containing the vocabulary entries.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p> <p> <code> https://s3-&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>https://s3-us-east-1.amazonaws.com/examplebucket/vocab.txt</code> </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary\\\">Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that was updated.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was updated.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"Vocabularies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyInfo\"}\
    },\
    \"VocabularyInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. If the state is <code>READY</code> you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom vocabulary. </p>\"\
    },\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"READY\",\
        \"FAILED\"\
      ]\
    }\
  },\
  \"documentation\":\"<p>Operations and objects for transcribing speech to text.</p>\"\
}\
";
}

@end
