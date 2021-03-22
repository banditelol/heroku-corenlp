FROM java:jre-alpine

RUN apk add --update --no-cache unzip wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-3.9.2.zip
RUN unzip stanford-corenlp-3.9.2.zip && rm stanford-corenlp-3.9.2.zip

WORKDIR stanford-corenlp-3.9.2

RUN export CLASSPATH="`find . -name '*.jar'`"

CMD java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000
