#!/usr/bin/env sh

################################################################################
#                                configure.sh                                  #
# Use this template as the beginning of a new program. Place a short           #
#                                                                              #
# 02/11/2023  Riccardo Pala                                                    #
################################################################################

cd $(dirname "$0")
WORKING_DIR=$(pwd)
SRC_DIR=$WORKING_DIR/src
PROFILE_DIR=$WORKING_DIR/profiles

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Generate files to deploy an AI model."
   echo
   echo "Syntax: configure.sh [who|ada|mc|mp]" # TODO recomm
   echo "options:"
   echo "  who   Generate files for WHO Adherence."
   echo "  ada   Generate files for ADA Adherence."
   echo "  mc    Generate files for Mobility Concern."
   echo "  mp    Generate files for Mobility Progress."
  #  echo "rec    Generate files for ___." # TODO recomm
   echo
}

################################################################################
# Process the input options                                                    #
################################################################################
while :; do
  case $1 in
    who)
      source $PROFILE_DIR/who
      break;;
    ada)
      source $PROFILE_DIR/ada
      break;;
    mc)
      source $PROFILE_DIR/mobility-concern
      break;;
    mp)
      source $PROFILE_DIR/mobility-progress
      break;;
    # TODO recomm
    # rec)
    #   source $PROFILE_DIR/rec
    #   break;;
    *)
      Help
      exit;;
  esac
done

################################################################################
# Generate get-jdk.sh                                                    #
################################################################################
jdk_filename="get-jdk.sh"
tmp_file="$SRC_DIR/${jdk_filename}-tmp"
cp "$SRC_DIR/${jdk_filename}-dist" $tmp_file
mv $tmp_file $WORKING_DIR/$jdk_filename

################################################################################
# Generate get-dependences.sh                                                    #
################################################################################
dependences_filename="get-dependences.sh"
tmp_file="$SRC_DIR/${dependences_filename}-tmp"
cp "$SRC_DIR/${dependences_filename}-dist" $tmp_file
sed -i'.bak' "s#__JAR_VERS__#${jar_vers}#" $tmp_file
sed -i'.bak' "s#__JAR_NAME__#${jar_name}#" $tmp_file
sed -i'.bak' "s#__MAVEN_REPOSITORY__#${maven_repository}#" $tmp_file
mv $tmp_file $WORKING_DIR/$dependences_filename

################################################################################
# test.ipynb                                                                   #
################################################################################
test_filename="test.ipynb"
tmp_file="$SRC_DIR/${test_filename}-tmp"
cp "$SRC_DIR/${test_filename}-dist" $tmp_file
sed -i'.bak' "s#__PROJECT_NAME__#${project_name}#" $tmp_file
mv $tmp_file $WORKING_DIR/$test_filename

################################################################################
# Generate apihandler                                                          #
################################################################################
apihandler_filename="apihandler.py"
tmp_file="$SRC_DIR/${apihandler_filename}-tmp"
cp "$SRC_DIR/${apihandler_filename}-dist" $tmp_file
sed -i'.bak' "s#__JAR_VERS__#${jar_vers}#" $tmp_file
sed -i'.bak' "s#__JAR_NAME__#${jar_name}#" $tmp_file
sed -i'.bak' "s#__PROJECT_NAME__#${project_name}#" $tmp_file
sed -i'.bak' "s#__EZ_NAMESPACE__#${ez_namespace}#" $tmp_file
sed -i'.bak' "s#__MODEL_ID__#${model_id}#" $tmp_file
sed -i'.bak' "s#__MODEL_DESC__#${model_desc}#" $tmp_file
sed -i'.bak' "s#__DEPLOYM_DESC__#${deploym_desc}#" $tmp_file
sed -i'.bak' "s#__MARKER__#${marker}#" $tmp_file
mv $tmp_file "$WORKING_DIR/${project_name}_${apihandler_filename}"

################################################################################
# Generate deployment.ipynb                                                    #
################################################################################
deployment_filename="deployment.ipynb"
tmp_file="$SRC_DIR/${deployment_filename}-tmp"
cp "$SRC_DIR/${deployment_filename}-dist" $tmp_file
sed -i'.bak' "s#__PROJECT_NAME__#${project_name}#" $tmp_file
mv $tmp_file $WORKING_DIR/$deployment_filename

################################################################################
# Generate run.ipynb                                                           #
################################################################################
run_filename="run.ipynb"
tmp_file="$SRC_DIR/${run_filename}-tmp"
cp "$SRC_DIR/${run_filename}-dist" $tmp_file
sed -i'.bak' "s#__PROJECT_NAME__#${project_name}#" $tmp_file
sed -i'.bak' "s#__MODEL_ID__#${model_id}#" $tmp_file
sed -i'.bak' "s#__MODEL_DESC__#${model_desc}#" $tmp_file
mv $tmp_file $WORKING_DIR/$run_filename

################################################################################
# Purge temporary file                                                         #
################################################################################
rm ${SRC_DIR}/*.bak
