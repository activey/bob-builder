using bob.builder.recipe.project;
using bob.builder.json;

namespace bob.builder.build.plugin {

	public class BuildConfigurationBuilder {

		private const string PROPERTY_VERBOSE = "verbose";

		private string _targetDirectory = "";
		private string _targetFileName = "";
		private bool _generateVapi = false;
		private string _outputVapiDirectory = "";
		private string _outputVapiFileName = "";
		private string _cOutputDirectory = "";
		private string _cHeaderFileName = "";

		private BuildConfiguration buildConfiguration;

		public BuildConfigurationBuilder.fromJSONObject(JsonObject jsonObject) {
			buildConfiguration = new BuildConfiguration();
			readJsonProperties(jsonObject);		
		}

		private void readJsonProperties(JsonObject jsonObject) {
			buildConfiguration.verbose = jsonObject.getBooleanEntry(PROPERTY_VERBOSE, false);
		}

		public BuildConfigurationBuilder addSource(BobBuildProjectSourceFile source) {
			buildConfiguration.addSource(source);
			return this;
		}

		public BuildConfigurationBuilder addDependency(BobBuildProjectDependency dependency) {
			buildConfiguration.addDependency(dependency);
			return this;
		}

		public BuildConfigurationBuilder targetDirectory(string targetDirectory) {
			_targetDirectory = targetDirectory;
			return this;
		} 

		public BuildConfigurationBuilder targetFileName(string targetFileName) {
			_targetFileName = targetFileName;
			return this;
		} 

		public BuildConfigurationBuilder generateVapi() {
			_generateVapi = true;
			return this;
		}

		public BuildConfigurationBuilder vapiOutputDirectory(string vapiOutputDirectory) {
			_outputVapiDirectory = vapiOutputDirectory;
			return this;
		}

		public BuildConfigurationBuilder vapiOutputFileName(string vapiOutputFileName) {
			_outputVapiFileName = vapiOutputFileName;
			return this;
		}

		public BuildConfigurationBuilder ccOptions(string[] ccOptions) {
			buildConfiguration.ccOptions = ccOptions;
			return this;
		} 

		public BuildConfigurationBuilder cOutputDirectory(string cOutputDirectory) {
			_cOutputDirectory = cOutputDirectory;
			return this;
		}

		public BuildConfigurationBuilder cHeaderFileName(string cHeaderFileName) {
			_cHeaderFileName = cHeaderFileName;
			return this;
		}

		public BuildConfiguration build() {
			buildConfiguration.targetFile = "%s%C%s".printf(_targetDirectory, Path.DIR_SEPARATOR, _targetFileName);
			if (_generateVapi) {
				buildConfiguration.generateVapi = true;
				buildConfiguration.outputVapiFile = "%s%C%s".printf(_outputVapiDirectory, Path.DIR_SEPARATOR, _outputVapiFileName);
				buildConfiguration.outputHFile = "%s%C%s".printf(_cOutputDirectory, Path.DIR_SEPARATOR, _cHeaderFileName);
			}
			return buildConfiguration;
		}
	}
}