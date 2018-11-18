rm -rf tagtest.bare
rm -rf tagtest
tar xzf tagtest.bare.tgz
git clone $PWD/tagtest.bare tagtest
cd tagtest
./gradlew release -Prelease.version="1.1.0"
git checkout -b feature2
echo c2 > c2
git add c2
git commit -m "added c2"
./gradlew markNextVersion 
./gradlew cV
git checkout master
./gradlew cV
git checkout -b feature1
echo c1 > c1
git add c1
git commit -m "added c1"
./gradlew markNextVersion
./gradlew cV
git checkout master
git merge feature2
./gradlew cV
./gradlew cV -Prelease.useHighestVersion
git merge -m "merge feature1" feature1
./gradlew cV
./gradlew cV -Prelease.useHighestVersion
