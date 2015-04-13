/* bob-builder.vapi generated by valac 0.28.0, do not modify. */

namespace com {
	namespace futureprocessing {
		namespace bob {
			namespace ansi {
				[CCode (cheader_filename = "bob-builder.h")]
				public class AnsiColorGenerator {
					public AnsiColorGenerator ();
					public string getBlue ();
					public string getDefault ();
					public string getGreen ();
					public string getRed ();
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class AnsiPrinter {
					public AnsiPrinter ();
					public com.futureprocessing.bob.ansi.AnsiPrinterSession startSession ();
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class AnsiPrinterSession {
					public AnsiPrinterSession ();
					public void commit (GLib.FileStream stream);
					public void flush (GLib.FileStream stream);
					public void reset (GLib.FileStream stream);
					public void setBold (bool bold);
					public void setColorBlue ();
					public void setColorDefault ();
					public void setColorGreen ();
					public void setColorRed ();
				}
			}
			namespace build {
				namespace plugin {
					[CCode (cheader_filename = "bob-builder.h")]
					public abstract class AbstractBobBuildPlugin : GLib.Object {
						public AbstractBobBuildPlugin (string pluginName);
						public abstract void initialize (com.futureprocessing.bob.recipe.plugin.BobBuildPluginRecipe pluginRecipe) throws com.futureprocessing.bob.build.plugin.BobBuildPluginError;
						public abstract void run (com.futureprocessing.bob.recipe.project.BobBuildProjectRecipe projectRecipe) throws com.futureprocessing.bob.build.plugin.BobBuildPluginError;
						public string name { get; set construct; }
					}
					[CCode (cheader_filename = "bob-builder.h")]
					public class BobBuildPluginExecutionChain {
						public delegate void PluginToRunDelegate (com.futureprocessing.bob.build.plugin.AbstractBobBuildPlugin pluginToRun);
						public BobBuildPluginExecutionChain ();
						public void addPlugin (string pluginToRun);
						public void preparePlugins (com.futureprocessing.bob.build.plugin.BobBuildPluginExecutionChain.PluginToRunDelegate pluginToRunDelegate) throws com.futureprocessing.bob.build.plugin.BobBuildPluginError;
						public void runPlugins (com.futureprocessing.bob.recipe.project.BobBuildProjectRecipe projectRecipe) throws com.futureprocessing.bob.build.plugin.BobBuildPluginError;
					}
					[CCode (cheader_filename = "bob-builder.h")]
					public class BobBuildPluginLoader {
						public BobBuildPluginLoader ();
						public void addPlugin (com.futureprocessing.bob.build.plugin.AbstractBobBuildPlugin buildPlugin);
						public BobBuildPluginLoader.for_plugins_directory (string? pluginsDirectoryLocation);
						public com.futureprocessing.bob.build.plugin.AbstractBobBuildPlugin? getPlugin (string pluginName);
					}
					[CCode (cheader_filename = "bob-builder.h")]
					public errordomain BobBuildPluginError {
						INITIALIZATION_ERROR,
						RUN_ERROR
					}
					[CCode (cheader_filename = "bob-builder.h")]
					public errordomain BuildPluginError {
						PLUGINS_FOLDER_MISSING,
						MODULE_NOT_FOUND_ERROR,
						MODULE_TYPE_FUNCTION_MISSING_ERROR,
						DEPENDENCY_MISSING
					}
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class BobBuildContext : GLib.Object {
					public BobBuildContext ();
					public void addPlugin (string buildPlugin);
					public void proceed ();
					public BobBuildContext.withRecipe (com.futureprocessing.bob.recipe.BobBuildRecipe buildRecipe);
				}
			}
			namespace filesystem {
				[CCode (cheader_filename = "bob-builder.h")]
				public class DirectoryObject : com.futureprocessing.bob.filesystem.FileSystemObject {
					public DirectoryObject (GLib.File directory);
					public DirectoryObject.fromGivenLocation (string directoryLocation);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class FileObject : com.futureprocessing.bob.filesystem.FileSystemObject {
					public FileObject (GLib.File file);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public abstract class FileSystemFilteringVisitor : com.futureprocessing.bob.filesystem.FileSystemVisitor {
					public FileSystemFilteringVisitor (com.futureprocessing.bob.filesystem.FileFilter filter);
					protected abstract void visitFileFiltered (GLib.File file);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class Runtime {
					public Runtime ();
					public static string getRuntimeDirectory ();
					public static string resolveRuntimeRelativePath (string relativePath);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public interface FileFilter : GLib.Object {
					public abstract bool fileMatchesCriteria (GLib.File file);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public interface FileSystemObject {
					public abstract void accept (com.futureprocessing.bob.filesystem.FileSystemVisitor visitor);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public interface FileSystemVisitor {
					public abstract void visitFile (GLib.File file);
				}
			}
			namespace json {
				[CCode (cheader_filename = "bob-builder.h")]
				public class JsonArray : GLib.Object {
					public delegate void EachMemberDelegate (com.futureprocessing.bob.json.JsonObject jsonObject);
					public JsonArray ();
					public void forEachMember (com.futureprocessing.bob.json.JsonArray.EachMemberDelegate eachMemberDelegate);
					public JsonArray.fromJsonArray (Json.Array jsonArray);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class JsonObject : GLib.Object {
					public JsonObject ();
					public JsonObject.fromJsonObject (Json.Object jsonObject);
					public bool getBooleanEntry (string key, bool defaultIfNull);
					public com.futureprocessing.bob.json.JsonObject? getJsonObjectEntry (string key);
					public com.futureprocessing.bob.json.JsonArray? getObjectArrayEntry (string key);
					public string getStringEntry (string key, string? defaultIfNull);
				}
			}
			namespace log {
				[CCode (cheader_filename = "bob-builder.h")]
				public class Logger {
					public static com.futureprocessing.bob.log.Logger getLogger (string loggerId);
					public void logError (string message, ...);
					public void logInfo (string message, ...);
					public void logSuccess (string message, ...);
				}
			}
			namespace recipe {
				namespace plugin {
					[CCode (cheader_filename = "bob-builder.h")]
					public class BobBuildPluginRecipe : GLib.Object {
						public BobBuildPluginRecipe (string name, com.futureprocessing.bob.json.JsonObject jsonConfiguration);
						public BobBuildPluginRecipe.@default ();
						public com.futureprocessing.bob.json.JsonObject jsonConfiguration { get; set construct; }
						public string name { get; set construct; }
					}
				}
				namespace project {
					[CCode (cheader_filename = "bob-builder.h")]
					public class BobBuildProjectRecipe {
						public BobBuildProjectRecipe ();
						public void addLibSourceFile (GLib.File projectSourceFile);
						public void addMainSourceFile (GLib.File projectSourceFile);
						public GLib.List<com.futureprocessing.bob.recipe.project.BobBuildProjectSourceFile> libSourceFiles { get; }
						public GLib.List<com.futureprocessing.bob.recipe.project.BobBuildProjectSourceFile> mainSourceFiles { get; }
						public string name { get; set; }
						public string shortName { get; set; }
						public string version { get; set; }
					}
					[CCode (cheader_filename = "bob-builder.h")]
					public class BobBuildProjectSourceFile : GLib.Object {
						public BobBuildProjectSourceFile ();
						public BobBuildProjectSourceFile.fromFileSystem (GLib.File projectSourceFile);
						public string fileLocation { get; set; }
						public int64 fileSize { get; set; }
					}
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class BobBuildRecipe : GLib.Object {
					public BobBuildRecipe ();
					public void addPluginRecipe (com.futureprocessing.bob.recipe.plugin.BobBuildPluginRecipe recipe);
					public com.futureprocessing.bob.recipe.plugin.BobBuildPluginRecipe? getPluginRecipe (string pluginName);
					public com.futureprocessing.bob.recipe.project.BobBuildProjectRecipe project { get; set; }
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class BobBuildRecipeBuilder : GLib.Object {
					public BobBuildRecipeBuilder ();
					public com.futureprocessing.bob.recipe.BobBuildRecipe build ();
					public com.futureprocessing.bob.recipe.BobBuildRecipeBuilder plugin (com.futureprocessing.bob.recipe.plugin.BobBuildPluginRecipe pluginRecipe);
					public com.futureprocessing.bob.recipe.BobBuildRecipeBuilder project (string name, string shortName, string version);
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class BobBuildRecipeLoader {
					public static com.futureprocessing.bob.recipe.BobBuildRecipe loadFromJSON () throws GLib.Error;
					public com.futureprocessing.bob.recipe.BobBuildRecipe? loadFromJSONFile (string jsonFileName) throws GLib.Error;
				}
				[CCode (cheader_filename = "bob-builder.h")]
				public class BobBuildRecipeParser : GLib.Object {
					public static com.futureprocessing.bob.recipe.BobBuildRecipe parseFromJSONFile (GLib.FileInfo jsonFile) throws GLib.Error;
					public com.futureprocessing.bob.recipe.BobBuildRecipe parseFromJSONObject (Json.Object jsonObject);
				}
			}
		}
	}
}
[CCode (cheader_filename = "bob-builder.h")]
public class BobBuildPluginInfo : GLib.Object {
	public GLib.Module module;
	public GLib.Type type;
	public BobBuildPluginInfo (GLib.Type type, owned GLib.Module module);
}
