" Vim syntax file class
" Language:	Groovy
" Original Author:	Alessio Pace <billy.corgan@tiscali.it>
" Maintainer:	Tobias Rapp <yahuxo@gmx.de>
" Version: 	0.1.13
" URL:	  http://www.vim.org/scripts/script.php?script_id=945
" Last Change:	2013 Apr 24

" THE ORIGINAL AUTHOR'S NOTES:
"
" This is my very first vim script, I hope to have
" done it the right way.
"
" I must directly or indirectly thank the author of java.vim and ruby.vim:
" I copied from them most of the stuff :-)
"
" Relies on html.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"
" HOWTO USE IT (INSTALL) when not part of the distribution:
"
" 1) copy the file in the (global or user's $HOME/.vim/syntax/) syntax folder
"
" 2) add this line to recognize groovy files by filename extension:
"
" au BufNewFile,BufRead *.groovy  setf groovy
" in the global vim filetype.vim file or inside $HOME/.vim/filetype.vim
"
" 3) add this part to recognize by content groovy script (no extension needed :-)
"
"  if did_filetype()
"    finish
"  endif
"  if getline(1) =~ '^#!.*[/\\]groovy\>'
"    setf groovy
"  endif
"
"  in the global scripts.vim file or in $HOME/.vim/scripts.vim
"
" 4) open/write a .groovy file or a groovy script :-)
"
" Let me know if you like it or send me patches, so that I can improve it
" when I have time

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='groovy'
endif

let s:cpo_save = &cpo
set cpo&vim

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ GroovyHiLink hi link <args>
else
  command! -nargs=+ GroovyHiLink hi def link <args>
endif

" ##########################
" Java stuff taken from java.vim
" some characters that cannot be in a groovy program (outside a string)
" syn match groovyError "[\\@`]"
"syn match groovyError "<<<\|\.\.\|=>\|<>\|||=\|&&=\|[^-]->\|\*\/"
"syn match groovyOK "\.\.\."

" keyword definitions
syn keyword groovyExternal        native package
syn match groovyExternal          "\<import\>\(\s\+static\>\)\?"
syn keyword groovyError           goto const
syn keyword groovyConditional     if else switch
syn keyword groovyRepeat          while for do
syn keyword groovyBoolean         true false
syn keyword groovyConstant        null
syn keyword groovyTypedef         this super
syn keyword groovyOperator        new instanceof
syn keyword groovyType            boolean char byte short int long float double
syn keyword groovyType            void
syn keyword groovyType		  Integer Double Date Boolean Float String Array Vector List
syn keyword groovyStatement       return
syn keyword groovyStorageClass    static synchronized transient volatile final strictfp serializable
syn keyword groovyExceptions      throw try catch finally
syn keyword groovyAssert          assert
syn keyword groovyMethodDecl      synchronized throws
syn keyword groovyClassDecl       extends implements interface
" to differentiate the keyword class from MyClass.class we use a match here
syn match   groovyTypedef         "\.\s*\<class\>"ms=s+1
syn keyword groovyClassDecl         enum
syn match   groovyClassDecl       "^class\>"
syn match   groovyClassDecl       "[^.]\s*\<class\>"ms=s+1
syn keyword groovyBranch          break continue nextgroup=groovyUserLabelRef skipwhite
syn match   groovyUserLabelRef    "\k\+" contained
syn keyword groovyScopeDecl       public protected private abstract


"if exists("groovy_highlight_groovy_lang_ids") || exists("groovy_highlight_groovy_lang") || exists("groovy_highlight_all")
  " groovy.lang.*
  syn keyword groovyLangClass  Closure MetaMethod GroovyObject

  syn match groovyJavaLangClass "\<System\>"
  syn keyword groovyJavaLangClass  Cloneable Comparable Runnable Serializable Boolean Byte Class Object
  syn keyword groovyJavaLangClass  Character CharSequence ClassLoader Compiler
  " syn keyword groovyJavaLangClass  Integer Double Float Long
  syn keyword groovyJavaLangClass  InheritableThreadLocal Math Number Object Package Process
  syn keyword groovyJavaLangClass  Runtime RuntimePermission InheritableThreadLocal
  syn keyword groovyJavaLangClass  SecurityManager Short StrictMath StackTraceElement
  syn keyword groovyJavaLangClass  StringBuffer Thread ThreadGroup
  syn keyword groovyJavaLangClass  ThreadLocal Throwable Void ArithmeticException
  syn keyword groovyJavaLangClass  ArrayIndexOutOfBoundsException AssertionError
  syn keyword groovyJavaLangClass  ArrayStoreException ClassCastException
  syn keyword groovyJavaLangClass  ClassNotFoundException
  syn keyword groovyJavaLangClass  CloneNotSupportedException Exception
  syn keyword groovyJavaLangClass  IllegalAccessException
  syn keyword groovyJavaLangClass  IllegalArgumentException
  syn keyword groovyJavaLangClass  IllegalMonitorStateException
  syn keyword groovyJavaLangClass  IllegalStateException
  syn keyword groovyJavaLangClass  IllegalThreadStateException
  syn keyword groovyJavaLangClass  IndexOutOfBoundsException
  syn keyword groovyJavaLangClass  InstantiationException InterruptedException
  syn keyword groovyJavaLangClass  NegativeArraySizeException NoSuchFieldException
  syn keyword groovyJavaLangClass  NoSuchMethodException NullPointerException
  syn keyword groovyJavaLangClass  NumberFormatException RuntimeException
  syn keyword groovyJavaLangClass  SecurityException StringIndexOutOfBoundsException
  syn keyword groovyJavaLangClass  UnsupportedOperationException
  syn keyword groovyJavaLangClass  AbstractMethodError ClassCircularityError
  syn keyword groovyJavaLangClass  ClassFormatError Error ExceptionInInitializerError
  syn keyword groovyJavaLangClass  IllegalAccessError InstantiationError
  syn keyword groovyJavaLangClass  IncompatibleClassChangeError InternalError
  syn keyword groovyJavaLangClass  LinkageError NoClassDefFoundError
  syn keyword groovyJavaLangClass  NoSuchFieldError NoSuchMethodError
  syn keyword groovyJavaLangClass  OutOfMemoryError StackOverflowError
  syn keyword groovyJavaLangClass  ThreadDeath UnknownError UnsatisfiedLinkError
  syn keyword groovyJavaLangClass  UnsupportedClassVersionError VerifyError
  syn keyword groovyJavaLangClass  VirtualMachineError

  syn keyword groovyJavaLangClass AbstractButton AbstractCollection AbstractMap Appendable
  syn keyword groovyJavaLangClass BigDecimal BigInteger BitSet BlockingQueue Boolean BufferedReader BufferedWriter ButtonGroup 
  syn keyword groovyJavaLangClass Calendar CharSequence Character Class ClassLoader Closeable Collection Comparable Container
  syn keyword groovyJavaLangClass DataInputStream Date Date DefaultComboBoxModel DefaultListModel DefaultMutableTreeNode DefaultTableModel
  syn keyword groovyJavaLangClass Element Enum Enumeration
  syn keyword groovyJavaLangClass File Float
  syn keyword groovyJavaLangClass InputStream Iterable Iterator
  syn keyword groovyJavaLangClass JComboBox JMenu JMenuBar JPopupMenu JTabbedPane JToolBar
  syn keyword groovyJavaLangClass ListModel Long 
  syn keyword groovyJavaLangClass Map Matcher MutableComboBoxModel MutableTreeNode NodeList
  syn keyword groovyJavaLangClass Number
  syn keyword groovyJavaLangClass ObjectInputStream ObjectOutputStream OutputStream
  syn keyword groovyJavaLangClass Path Pattern PrintStream PrintWriter Process
  syn keyword groovyJavaLangClass Reader ResourceBundle ResultSet ResultSetMetaData
  syn keyword groovyJavaLangClass ServerSocket Set Socket SortedMap SortedSet String StringBuffer StringBuilder
  syn keyword groovyJavaLangClass TableColumnModel TableModel Thread Timer Timestamp TreeNode TreePath
  syn keyword groovyJavaLangClass URL
  syn keyword groovyJavaLangClass Writer
  syn keyword groovyJavaLangClass ASTHelper
  syn keyword groovyJavaLangClass ASTNode
  syn keyword groovyJavaLangClass ASTParserException
  syn keyword groovyJavaLangClass ASTRuntimeException
  syn keyword groovyJavaLangClass ASTTest
  syn keyword groovyJavaLangClass ASTTestTransformation
  syn keyword groovyJavaLangClass ASTTestTransformation.LabelFinder
  syn keyword groovyJavaLangClass ASTTransformation
  syn keyword groovyJavaLangClass ASTTransformationCollectorCodeVisitor
  syn keyword groovyJavaLangClass ASTTransformationCustomizer
  syn keyword groovyJavaLangClass ASTTransformationCustomizerFactory
  syn keyword groovyJavaLangClass ASTTransformationVisitor
  syn keyword groovyJavaLangClass ASTTransformationsContext
  syn keyword groovyJavaLangClass AbstractASTTransformUtil
  syn keyword groovyJavaLangClass AbstractASTTransformation
  syn keyword groovyJavaLangClass AbstractButtonProperties
  syn keyword groovyJavaLangClass AbstractCallSite
  syn keyword groovyJavaLangClass AbstractComparator
  syn keyword groovyJavaLangClass AbstractConcurrentDoubleKeyMap
  syn keyword groovyJavaLangClass AbstractConcurrentMap
  syn keyword groovyJavaLangClass AbstractConcurrentMap.Entry
  syn keyword groovyJavaLangClass AbstractConcurrentMap.Segment
  syn keyword groovyJavaLangClass AbstractConcurrentMapBase
  syn keyword groovyJavaLangClass AbstractConcurrentMapBase.Entry
  syn keyword groovyJavaLangClass AbstractConcurrentMapBase.Segment
  syn keyword groovyJavaLangClass AbstractFactory
  syn keyword groovyJavaLangClass AbstractFullBinding
  syn keyword groovyJavaLangClass AbstractHttpServlet
  syn keyword groovyJavaLangClass AbstractInterruptibleASTTransformation
  syn keyword groovyJavaLangClass AbstractReaderSource
  syn keyword groovyJavaLangClass AbstractStreamingBuilder
  syn keyword groovyJavaLangClass AbstractSyntheticBinding
  syn keyword groovyJavaLangClass AbstractSyntheticMetaMethods
  syn keyword groovyJavaLangClass AbstractTypeCheckingExtension
  syn keyword groovyJavaLangClass ActionFactory
  syn keyword groovyJavaLangClass AdaptingMetaClass
  syn keyword groovyJavaLangClass AggregateBinding
  syn keyword groovyJavaLangClass AliasCommand
  syn keyword groovyJavaLangClass AliasTargetProxyCommand
  syn keyword groovyJavaLangClass AllTestSuite
  syn keyword groovyJavaLangClass AnnotatedNode
  syn keyword groovyJavaLangClass AnnotationCollector
  syn keyword groovyJavaLangClass AnnotationCollectorTransform
  syn keyword groovyJavaLangClass AnnotationCollectorTransform.ClassChanger
  syn keyword groovyJavaLangClass AnnotationConstantExpression
  syn keyword groovyJavaLangClass AnnotationConstantsVisitor
  syn keyword groovyJavaLangClass AnnotationNode
  syn keyword groovyJavaLangClass AnnotationVisitor
  syn keyword groovyJavaLangClass AnsiDetector
  syn keyword groovyJavaLangClass AntBuilder
  syn keyword groovyJavaLangClass AntProjectPropertiesDelegate
  syn keyword groovyJavaLangClass AntlrASTProcessSnippets
  syn keyword groovyJavaLangClass AntlrASTProcessor
  syn keyword groovyJavaLangClass AntlrParserPlugin
  syn keyword groovyJavaLangClass AntlrParserPluginFactory
  syn keyword groovyJavaLangClass ArgumentListExpression
  syn keyword groovyJavaLangClass ArrayCachedClass
  syn keyword groovyJavaLangClass ArrayClassDocWrapper
  syn keyword groovyJavaLangClass ArrayExpression
  syn keyword groovyJavaLangClass ArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass ArrayIterator
  syn keyword groovyJavaLangClass ArrayMetaMethod
  syn keyword groovyJavaLangClass ArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass ArrayUtil
  syn keyword groovyJavaLangClass ArrayUtils
  syn keyword groovyJavaLangClass AsmClassGenerator
  syn keyword groovyJavaLangClass AssertStatement
  syn keyword groovyJavaLangClass AssertionRenderer
  syn keyword groovyJavaLangClass AssertionWriter
  syn keyword groovyJavaLangClass AstBrowser
  syn keyword groovyJavaLangClass AstBrowserNodeMaker
  syn keyword groovyJavaLangClass AstBrowserUiPreferences
  syn keyword groovyJavaLangClass AstBuilder
  syn keyword groovyJavaLangClass AstBuilderTransformation
  syn keyword groovyJavaLangClass AstHelper
  syn keyword groovyJavaLangClass AstNodeToScriptAdapter
  syn keyword groovyJavaLangClass AstNodeToScriptVisitor
  syn keyword groovyJavaLangClass AstSpecificationCompiler
  syn keyword groovyJavaLangClass AstStringCompiler
  syn keyword groovyJavaLangClass AstToTextHelper
  syn keyword groovyJavaLangClass Attribute
  syn keyword groovyJavaLangClass AttributeExpression
  syn keyword groovyJavaLangClass Attributes
  syn keyword groovyJavaLangClass AutoClone
  syn keyword groovyJavaLangClass AutoCloneASTTransformation
  syn keyword groovyJavaLangClass AutoCloneStyle
  syn keyword groovyJavaLangClass AutoExternalize
  syn keyword groovyJavaLangClass AutoIndentAction
  syn keyword groovyJavaLangClass BaseDuration
  syn keyword groovyJavaLangClass BaseDuration.From
  syn keyword groovyJavaLangClass BaseJsonParser
  syn keyword groovyJavaLangClass BaseMarkupBuilder
  syn keyword groovyJavaLangClass BaseScript
  syn keyword groovyJavaLangClass BaseScriptASTTransformation
  syn keyword groovyJavaLangClass BaseTemplate
  syn keyword groovyJavaLangClass BasicContentPane
  syn keyword groovyJavaLangClass BatchingPreparedStatementWrapper
  syn keyword groovyJavaLangClass BatchingStatementWrapper
  syn keyword groovyJavaLangClass BeanFactory
  syn keyword groovyJavaLangClass BenchmarkInterceptor
  syn keyword groovyJavaLangClass BevelBorderFactory
  syn keyword groovyJavaLangClass BigDecimalCachedClass
  syn keyword groovyJavaLangClass BigDecimalMath
  syn keyword groovyJavaLangClass BigIntegerCachedClass
  syn keyword groovyJavaLangClass BigIntegerMath
  syn keyword groovyJavaLangClass BinaryBooleanExpressionHelper
  syn keyword groovyJavaLangClass BinaryDoubleExpressionHelper
  syn keyword groovyJavaLangClass BinaryExpression
  syn keyword groovyJavaLangClass BinaryExpressionHelper
  syn keyword groovyJavaLangClass BinaryExpressionMultiTypeDispatcher
  syn keyword groovyJavaLangClass BinaryExpressionTransformer
  syn keyword groovyJavaLangClass BinaryExpressionWriter
  syn keyword groovyJavaLangClass BinaryFloatExpressionHelper
  syn keyword groovyJavaLangClass BinaryIntExpressionHelper
  syn keyword groovyJavaLangClass BinaryLongExpressionHelper
  syn keyword groovyJavaLangClass BinaryObjectExpressionHelper
  syn keyword groovyJavaLangClass BindFactory
  syn keyword groovyJavaLangClass BindGroupFactory
  syn keyword groovyJavaLangClass BindPath
  syn keyword groovyJavaLangClass BindProxyFactory
  syn keyword groovyJavaLangClass Bindable
  syn keyword groovyJavaLangClass BindableASTTransformation
  syn keyword groovyJavaLangClass Binding
  syn keyword groovyJavaLangClass BindingProxy
  syn keyword groovyJavaLangClass BindingUpdatable
  syn keyword groovyJavaLangClass BitwiseNegationExpression
  syn keyword groovyJavaLangClass BlockStatement
  syn keyword groovyJavaLangClass BooleanArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass BooleanArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass BooleanCachedClass
  syn keyword groovyJavaLangClass BooleanClosureWrapper
  syn keyword groovyJavaLangClass BooleanExpression
  syn keyword groovyJavaLangClass BooleanExpressionTransformer
  syn keyword groovyJavaLangClass BooleanReturningMethodInvoker
  syn keyword groovyJavaLangClass BooleanWrapper
  syn keyword groovyJavaLangClass BoxFactory
  syn keyword groovyJavaLangClass BoxLayoutFactory
  syn keyword groovyJavaLangClass BreakStatement
  syn keyword groovyJavaLangClass BufferManager
  syn keyword groovyJavaLangClass Buildable
  syn keyword groovyJavaLangClass Builder
  syn keyword groovyJavaLangClass Builder
  syn keyword groovyJavaLangClass Builder.Built
  syn keyword groovyJavaLangClass BuilderASTTransformation
  syn keyword groovyJavaLangClass BuilderASTTransformation.AbstractBuilderStrategy
  syn keyword groovyJavaLangClass BuilderASTTransformation.AbstractBuilderStrategy.PropertyInfo
  syn keyword groovyJavaLangClass BuilderASTTransformation.BuilderStrategy
  syn keyword groovyJavaLangClass BuilderSupport
  syn keyword groovyJavaLangClass ButtonGroupFactory
  syn keyword groovyJavaLangClass Byt
  syn keyword groovyJavaLangClass ByteArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass ByteArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass ByteCachedClass
  syn keyword groovyJavaLangClass ByteScanner
  syn keyword groovyJavaLangClass ByteWrapper
  syn keyword groovyJavaLangClass BytecodeCollector
  syn keyword groovyJavaLangClass BytecodeExpression
  syn keyword groovyJavaLangClass BytecodeHelper
  syn keyword groovyJavaLangClass BytecodeInstruction
  syn keyword groovyJavaLangClass BytecodeInterface8
  syn keyword groovyJavaLangClass BytecodeSequence
  syn keyword groovyJavaLangClass BytecodeVariable
  syn keyword groovyJavaLangClass CSTNode
  syn keyword groovyJavaLangClass Cache
  syn keyword groovyJavaLangClass CacheType
  syn keyword groovyJavaLangClass CachedClass
  syn keyword groovyJavaLangClass CachedClass.CachedMethodComparatorByName
  syn keyword groovyJavaLangClass CachedClass.CachedMethodComparatorWithString
  syn keyword groovyJavaLangClass CachedClosureClass
  syn keyword groovyJavaLangClass CachedConstructor
  syn keyword groovyJavaLangClass CachedField
  syn keyword groovyJavaLangClass CachedMethod
  syn keyword groovyJavaLangClass CachedPackage
  syn keyword groovyJavaLangClass CachedSAMClass
  syn keyword groovyJavaLangClass CachingGroovyEngine
  syn keyword groovyJavaLangClass CallSite
  syn keyword groovyJavaLangClass CallSiteArray
  syn keyword groovyJavaLangClass CallSiteAwareMetaMethod
  syn keyword groovyJavaLangClass CallSiteClassLoader
  syn keyword groovyJavaLangClass CallSiteGenerator
  syn keyword groovyJavaLangClass CallSiteWriter
  syn keyword groovyJavaLangClass CallSpec
  syn keyword groovyJavaLangClass Canonical
  syn keyword groovyJavaLangClass CanonicalASTTransformation
  syn keyword groovyJavaLangClass CaseStatement
  syn keyword groovyJavaLangClass CastExpression
  syn keyword groovyJavaLangClass CatchStatement
  syn keyword groovyJavaLangClass Category
  syn keyword groovyJavaLangClass CategoryASTTransformation
  syn keyword groovyJavaLangClass CellEditorFactory
  syn keyword groovyJavaLangClass CellEditorGetValueFactory
  syn keyword groovyJavaLangClass CellEditorPrepareFactory
  syn keyword groovyJavaLangClass CharBuf
  syn keyword groovyJavaLangClass CharSequenceValue
  syn keyword groovyJavaLangClass CharWrapper
  syn keyword groovyJavaLangClass CharacterArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass CharacterArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass CharacterCachedClass
  syn keyword groovyJavaLangClass CharacterSource
  syn keyword groovyJavaLangClass CharsetToolkit
  syn keyword groovyJavaLangClass Charsets
  syn keyword groovyJavaLangClass Chr
  syn keyword groovyJavaLangClass ClassCodeExpressionTransformer
  syn keyword groovyJavaLangClass ClassCodeVisitorSupport
  syn keyword groovyJavaLangClass ClassCompletionVerifier
  syn keyword groovyJavaLangClass ClassExpression
  syn keyword groovyJavaLangClass ClassExtender
  syn keyword groovyJavaLangClass ClassGenerator
  syn keyword groovyJavaLangClass ClassGeneratorException
  syn keyword groovyJavaLangClass ClassHelper
  syn keyword groovyJavaLangClass ClassInfo
  syn keyword groovyJavaLangClass ClassInfo.ClassInfoSet
  syn keyword groovyJavaLangClass ClassLoaderForClassArtifacts
  syn keyword groovyJavaLangClass ClassNode
  syn keyword groovyJavaLangClass ClassNodeResolver
  syn keyword groovyJavaLangClass ClassNodeResolver.LookupResult
  syn keyword groovyJavaLangClass ClasspathResourceManager
  syn keyword groovyJavaLangClass ClearCommand
  syn keyword groovyJavaLangClass CliBuilder
  syn keyword groovyJavaLangClass Closure
  syn keyword groovyJavaLangClass ClosureCellEditor
  syn keyword groovyJavaLangClass ClosureColumnFactory
  syn keyword groovyJavaLangClass ClosureComparator
  syn keyword groovyJavaLangClass ClosureException
  syn keyword groovyJavaLangClass ClosureExpression
  syn keyword groovyJavaLangClass ClosureExpressionTransformer
  syn keyword groovyJavaLangClass ClosureInvokingMethod
  syn keyword groovyJavaLangClass ClosureListExpression
  syn keyword groovyJavaLangClass ClosureMetaClass
  syn keyword groovyJavaLangClass ClosureMetaMethod
  syn keyword groovyJavaLangClass ClosureModel
  syn keyword groovyJavaLangClass ClosureParams
  syn keyword groovyJavaLangClass ClosureRenderer
  syn keyword groovyJavaLangClass ClosureSignatureHint
  syn keyword groovyJavaLangClass ClosureSourceBinding
  syn keyword groovyJavaLangClass ClosureStaticMetaMethod
  syn keyword groovyJavaLangClass ClosureTriggerBinding
  syn keyword groovyJavaLangClass ClosureWriter
  syn keyword groovyJavaLangClass ClosureWriter.UseExistingReference
  syn keyword groovyJavaLangClass CodeVisitorSupport
  syn keyword groovyJavaLangClass CollectRecursiveCalls
  syn keyword groovyJavaLangClass CollectionFactory
  syn keyword groovyJavaLangClass ColumnFactory
  syn keyword groovyJavaLangClass ColumnModelFactory
  syn keyword groovyJavaLangClass ComboBoxFactory
  syn keyword groovyJavaLangClass Command
  syn keyword groovyJavaLangClass CommandAlias
  syn keyword groovyJavaLangClass CommandException
  syn keyword groovyJavaLangClass CommandNameCompleter
  syn keyword groovyJavaLangClass CommandRegistry
  syn keyword groovyJavaLangClass CommandSupport
  syn keyword groovyJavaLangClass CommandsMultiCompleter
  syn keyword groovyJavaLangClass Commons
  syn keyword groovyJavaLangClass Commons.CommonsLoggingStrategy
  syn keyword groovyJavaLangClass CompareIdentityExpression
  syn keyword groovyJavaLangClass CompareToNullExpression
  syn keyword groovyJavaLangClass CompilationCustomizer
  syn keyword groovyJavaLangClass CompilationFailedException
  syn keyword groovyJavaLangClass CompilationUnit
  syn keyword groovyJavaLangClass CompilationUnit.ClassgenCallback
  syn keyword groovyJavaLangClass CompilationUnit.GroovyClassOperation
  syn keyword groovyJavaLangClass CompilationUnit.PrimaryClassNodeOperation
  syn keyword groovyJavaLangClass CompilationUnit.ProgressCallback
  syn keyword groovyJavaLangClass CompilationUnit.SourceUnitOperation
  syn keyword groovyJavaLangClass CompilationUnitAware
  syn keyword groovyJavaLangClass CompileDynamic
  syn keyword groovyJavaLangClass CompileDynamicProcessor
  syn keyword groovyJavaLangClass CompilePhase
  syn keyword groovyJavaLangClass CompilePhaseAdapter
  syn keyword groovyJavaLangClass CompileStack
  syn keyword groovyJavaLangClass CompileStack.BlockRecorder
  syn keyword groovyJavaLangClass CompileStack.LabelRange
  syn keyword groovyJavaLangClass CompileStatic
  syn keyword groovyJavaLangClass CompileTaskSupport
  syn keyword groovyJavaLangClass CompileUnit
  syn keyword groovyJavaLangClass Compiler
  syn keyword groovyJavaLangClass CompilerConfiguration
  syn keyword groovyJavaLangClass CompilerCustomizationBuilder
  syn keyword groovyJavaLangClass ComplexCommandSupport
  syn keyword groovyJavaLangClass ComplexKeyHashMap
  syn keyword groovyJavaLangClass ComplexKeyHashMap.Entry
  syn keyword groovyJavaLangClass ComplexKeyHashMap.EntryIterator
  syn keyword groovyJavaLangClass ComponentFactory
  syn keyword groovyJavaLangClass ComposedClosure
  syn keyword groovyJavaLangClass CompositeVisitor
  syn keyword groovyJavaLangClass CompoundBorderFactory
  syn keyword groovyJavaLangClass ConcurrentReaderHashMap
  syn keyword groovyJavaLangClass ConcurrentReaderHashMap.BarrierLock
  syn keyword groovyJavaLangClass ConcurrentReaderHashMap.Entry
  syn keyword groovyJavaLangClass ConcurrentReaderHashMap.HashIterator
  syn keyword groovyJavaLangClass ConcurrentReaderHashMap.KeyIterator
  syn keyword groovyJavaLangClass ConcurrentReaderHashMap.ValueIterator
  syn keyword groovyJavaLangClass ConditionalInterrupt
  syn keyword groovyJavaLangClass ConditionalInterruptibleASTTransformation
  syn keyword groovyJavaLangClass ConfigBinding
  syn keyword groovyJavaLangClass ConfigObject
  syn keyword groovyJavaLangClass ConfigSlurper
  syn keyword groovyJavaLangClass ConfigurationException
  syn keyword groovyJavaLangClass Console
  syn keyword groovyJavaLangClass ConsoleApplet
  syn keyword groovyJavaLangClass ConsoleIvyPlugin
  syn keyword groovyJavaLangClass ConsoleSupport
  syn keyword groovyJavaLangClass ConsoleTextEditor
  syn keyword groovyJavaLangClass ConstantExpression
  syn keyword groovyJavaLangClass ConstructorCallExpression
  syn keyword groovyJavaLangClass ConstructorCallTransformer
  syn keyword groovyJavaLangClass ConstructorMetaClassSite
  syn keyword groovyJavaLangClass ConstructorMetaMethodSite
  syn keyword groovyJavaLangClass ConstructorNode
  syn keyword groovyJavaLangClass ConstructorSite
  syn keyword groovyJavaLangClass ConstructorSite.ConstructorSiteNoUnwrap
  syn keyword groovyJavaLangClass ConstructorSite.ConstructorSiteNoUnwrapNoCoerce
  syn keyword groovyJavaLangClass ConstructorSite.NoParamSite
  syn keyword groovyJavaLangClass ConstructorSite.NoParamSiteInnerClass
  syn keyword groovyJavaLangClass ContinueStatement
  syn keyword groovyJavaLangClass ConversionHandler
  syn keyword groovyJavaLangClass ConvertedClosure
  syn keyword groovyJavaLangClass ConvertedMap
  syn keyword groovyJavaLangClass CurlyCountingGroovyLexer
  syn keyword groovyJavaLangClass CurriedClosure
  syn keyword groovyJavaLangClass CustomClassSyntaxCompletor
  syn keyword groovyJavaLangClass CustomizersFactory
  syn keyword groovyJavaLangClass DOMBuilder
  syn keyword groovyJavaLangClass DOMCategory
  syn keyword groovyJavaLangClass DataSet
  syn keyword groovyJavaLangClass DateFormatThreadLocal
  syn keyword groovyJavaLangClass DateGroovyMethods
  syn keyword groovyJavaLangClass Dates
  syn keyword groovyJavaLangClass DatumDependentDuration
  syn keyword groovyJavaLangClass DeclarationExpression
  syn keyword groovyJavaLangClass DefaultAction
  syn keyword groovyJavaLangClass DefaultCachedMethodKey
  syn keyword groovyJavaLangClass DefaultCommandsRegistrar
  syn keyword groovyJavaLangClass DefaultGroovyMethods
  syn keyword groovyJavaLangClass DefaultGroovyMethodsSupport
  syn keyword groovyJavaLangClass DefaultGroovyStaticMethods
  syn keyword groovyJavaLangClass DefaultMetaClassInfo
  syn keyword groovyJavaLangClass DefaultMetaClassInfo.ConstantMetaClassVersioning
  syn keyword groovyJavaLangClass DefaultMethodKey
  syn keyword groovyJavaLangClass DefaultPropertyAccessor
  syn keyword groovyJavaLangClass DefaultPropertyReader
  syn keyword groovyJavaLangClass DefaultPropertyWriter
  syn keyword groovyJavaLangClass DefaultStrategy
  syn keyword groovyJavaLangClass DefaultTableColumn
  syn keyword groovyJavaLangClass DefaultTableModel
  syn keyword groovyJavaLangClass DefaultTableModel.MyTableColumnModel
  syn keyword groovyJavaLangClass DefaultTypeCheckingExtension
  syn keyword groovyJavaLangClass DefaultTypeTransformation
  syn keyword groovyJavaLangClass Delegate
  syn keyword groovyJavaLangClass DelegateASTTransformation
  syn keyword groovyJavaLangClass DelegatesTo
  syn keyword groovyJavaLangClass DelegatesTo.Target
  syn keyword groovyJavaLangClass DelegatingController
  syn keyword groovyJavaLangClass DelegatingCustomizer
  syn keyword groovyJavaLangClass DelegatingIndentWriter
  syn keyword groovyJavaLangClass DelegatingMetaClass
  syn keyword groovyJavaLangClass DelegatingScript
  syn keyword groovyJavaLangClass Demand
  syn keyword groovyJavaLangClass DependencyTracker
  syn keyword groovyJavaLangClass DeprecationException
  syn keyword groovyJavaLangClass DgmConverter
  syn keyword groovyJavaLangClass DialogFactory
  syn keyword groovyJavaLangClass DisplayCommand
  syn keyword groovyJavaLangClass DoWhileStatement
  syn keyword groovyJavaLangClass DocCommand
  syn keyword groovyJavaLangClass DocGenerator
  syn keyword groovyJavaLangClass DomToGroovy
  syn keyword groovyJavaLangClass DoubleArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass DoubleArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass DoubleCachedClass
  syn keyword groovyJavaLangClass DoubleKeyHashMap
  syn keyword groovyJavaLangClass DoubleKeyHashMap.Entry
  syn keyword groovyJavaLangClass DoubleWrapper
  syn keyword groovyJavaLangClass DummyCallSite
  syn keyword groovyJavaLangClass DummyClassGenerator
  syn keyword groovyJavaLangClass Duration
  syn keyword groovyJavaLangClass DynamicVariable
  syn keyword groovyJavaLangClass EditCommand
  syn keyword groovyJavaLangClass ElvisOperatorExpression
  syn keyword groovyJavaLangClass EmptyBorderFactory
  syn keyword groovyJavaLangClass EmptyExpression
  syn keyword groovyJavaLangClass EmptyRange
  syn keyword groovyJavaLangClass EmptyStatement
  syn keyword groovyJavaLangClass EncodingAwareBufferedWriter
  syn keyword groovyJavaLangClass EncodingGroovyMethods
  syn keyword groovyJavaLangClass Entity
  syn keyword groovyJavaLangClass EnumCompletionVisitor
  syn keyword groovyJavaLangClass EnumConstantClassNode
  syn keyword groovyJavaLangClass EnumHelper
  syn keyword groovyJavaLangClass EnumVisitor
  syn keyword groovyJavaLangClass EqualsAndHashCode
  syn keyword groovyJavaLangClass EqualsAndHashCodeASTTransformation
  syn keyword groovyJavaLangClass ErrorCollector
  syn keyword groovyJavaLangClass ErrorReporter
  syn keyword groovyJavaLangClass EtchedBorderFactory
  syn keyword groovyJavaLangClass Eval
  syn keyword groovyJavaLangClass EventTriggerBinding
  syn keyword groovyJavaLangClass ExceptionMessage
  syn keyword groovyJavaLangClass Exceptions
  syn keyword groovyJavaLangClass Exceptions.JsonInternalException
  syn keyword groovyJavaLangClass ExitCommand
  syn keyword groovyJavaLangClass ExitNotification
  syn keyword groovyJavaLangClass ExpandedVariable
  syn keyword groovyJavaLangClass Expando
  syn keyword groovyJavaLangClass ExpandoMetaClass
  syn keyword groovyJavaLangClass ExpandoMetaClass.ExpandoMetaConstructor
  syn keyword groovyJavaLangClass ExpandoMetaClass.ExpandoMetaProperty
  syn keyword groovyJavaLangClass ExpandoMetaClassCreationHandle
  syn keyword groovyJavaLangClass Expression
  syn keyword groovyJavaLangClass ExpressionAsVariableSlot
  syn keyword groovyJavaLangClass ExpressionStatement
  syn keyword groovyJavaLangClass ExpressionTransformer
  syn keyword groovyJavaLangClass ExtendedVerifier
  syn keyword groovyJavaLangClass ExtensionMethodNode
  syn keyword groovyJavaLangClass ExtensionModule
  syn keyword groovyJavaLangClass ExtensionModuleRegistry
  syn keyword groovyJavaLangClass ExtensionModuleScanner
  syn keyword groovyJavaLangClass ExtensionModuleScanner.ExtensionModuleListener
  syn keyword groovyJavaLangClass ExternalGroovyClassDoc
  syn keyword groovyJavaLangClass ExternalStrategy
  syn keyword groovyJavaLangClass ExternalizeMethods
  syn keyword groovyJavaLangClass ExternalizeMethodsASTTransformation
  syn keyword groovyJavaLangClass ExternalizeVerifier
  syn keyword groovyJavaLangClass ExternalizeVerifierASTTransformation
  syn keyword groovyJavaLangClass Factory
  syn keyword groovyJavaLangClass FactoryBuilderSupport
  syn keyword groovyJavaLangClass FactorySupport
  syn keyword groovyJavaLangClass FastArray
  syn keyword groovyJavaLangClass FastStringUtils
  syn keyword groovyJavaLangClass FastStringUtils.StringImplementation
  syn keyword groovyJavaLangClass Field
  syn keyword groovyJavaLangClass FieldASTTransformation
  syn keyword groovyJavaLangClass FieldExpression
  syn keyword groovyJavaLangClass FieldNode
  syn keyword groovyJavaLangClass FileIterator
  syn keyword groovyJavaLangClass FileNameByRegexFinder
  syn keyword groovyJavaLangClass FileNameCompleter
  syn keyword groovyJavaLangClass FileNameFinder
  syn keyword groovyJavaLangClass FileOutputTool
  syn keyword groovyJavaLangClass FileReaderSource
  syn keyword groovyJavaLangClass FileScanner
  syn keyword groovyJavaLangClass FileSystemCompiler
  syn keyword groovyJavaLangClass FileSystemCompilerFacade
  syn keyword groovyJavaLangClass FileSystemResourceManager
  syn keyword groovyJavaLangClass FileType
  syn keyword groovyJavaLangClass FileVisitResult
  syn keyword groovyJavaLangClass FilteredAttributes
  syn keyword groovyJavaLangClass FilteredNodeChildren
  syn keyword groovyJavaLangClass Finalizable
  syn keyword groovyJavaLangClass FindReplaceUtility
  syn keyword groovyJavaLangClass FirstParam
  syn keyword groovyJavaLangClass FirstParam.Component
  syn keyword groovyJavaLangClass FirstParam.FirstGenericType
  syn keyword groovyJavaLangClass FirstParam.SecondGenericType
  syn keyword groovyJavaLangClass FirstParam.ThirdGenericType
  syn keyword groovyJavaLangClass FlatNodeListTraversal
  syn keyword groovyJavaLangClass FloatArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass FloatArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass FloatCachedClass
  syn keyword groovyJavaLangClass FloatWrapper
  syn keyword groovyJavaLangClass FloatingPointMath
  syn keyword groovyJavaLangClass FlushingStreamWriter
  syn keyword groovyJavaLangClass ForStatement
  syn keyword groovyJavaLangClass FormModel
  syn keyword groovyJavaLangClass FormattedTextFactory
  syn keyword groovyJavaLangClass FrameFactory
  syn keyword groovyJavaLangClass FromAbstractTypeMethods
  syn keyword groovyJavaLangClass FromString
  syn keyword groovyJavaLangClass FullBinding
  syn keyword groovyJavaLangClass GPathResult
  syn keyword groovyJavaLangClass GString
  syn keyword groovyJavaLangClass GStringExpression
  syn keyword groovyJavaLangClass GStringImpl
  syn keyword groovyJavaLangClass GStringTemplateEngine
  syn keyword groovyJavaLangClass GeneralUtils
  syn keyword groovyJavaLangClass GenerateStubsTask
  syn keyword groovyJavaLangClass GeneratedBytecodeAwareGroovyClassLoader
  syn keyword groovyJavaLangClass GeneratedClosure
  syn keyword groovyJavaLangClass GeneratedGroovyProxy
  syn keyword groovyJavaLangClass GeneratedMetaMethod
  syn keyword groovyJavaLangClass GeneratedMetaMethod.DgmMethodRecord
  syn keyword groovyJavaLangClass GeneratedMetaMethod.Proxy
  syn keyword groovyJavaLangClass GeneratorContext
  syn keyword groovyJavaLangClass GenericsType
  syn keyword groovyJavaLangClass GenericsUtils
  syn keyword groovyJavaLangClass GenericsVisitor
  syn keyword groovyJavaLangClass GetEffectivePogoFieldSite
  syn keyword groovyJavaLangClass GetEffectivePojoPropertySite
  syn keyword groovyJavaLangClass GlueFactory
  syn keyword groovyJavaLangClass GotoRecurHereException
  syn keyword groovyJavaLangClass Grab
  syn keyword groovyJavaLangClass GrabAnnotationTransformation
  syn keyword groovyJavaLangClass GrabConfig
  syn keyword groovyJavaLangClass GrabExclude
  syn keyword groovyJavaLangClass GrabResolver
  syn keyword groovyJavaLangClass Grape
  syn keyword groovyJavaLangClass GrapeEngine
  syn keyword groovyJavaLangClass GrapeIvy
  syn keyword groovyJavaLangClass GrapeUtil
  syn keyword groovyJavaLangClass Grapes
  syn keyword groovyJavaLangClass GridBagFactory
  syn keyword groovyJavaLangClass Groovifier
  syn keyword groovyJavaLangClass Groovy
  syn keyword groovyJavaLangClass GroovyASTTransformation
  syn keyword groovyJavaLangClass GroovyASTTransformationClass
  syn keyword groovyJavaLangClass GroovyAnnotationRef
  syn keyword groovyJavaLangClass GroovyAssert
  syn keyword groovyJavaLangClass GroovyAssert
  syn keyword groovyJavaLangClass GroovyBugError
  syn keyword groovyJavaLangClass GroovyCallable
  syn keyword groovyJavaLangClass GroovyCastException
  syn keyword groovyJavaLangClass GroovyCategorySupport
  syn keyword groovyJavaLangClass GroovyCategorySupport.CategoryMethod
  syn keyword groovyJavaLangClass GroovyCategorySupport.CategoryMethodList
  syn keyword groovyJavaLangClass GroovyCategorySupport.ThreadCategoryInfo
  syn keyword groovyJavaLangClass GroovyClass
  syn keyword groovyJavaLangClass GroovyClassDoc
  syn keyword groovyJavaLangClass GroovyClassLoader
  syn keyword groovyJavaLangClass GroovyClassLoader.ClassCollector
  syn keyword groovyJavaLangClass GroovyClassLoader.InnerLoader
  syn keyword groovyJavaLangClass GroovyClassVisitor
  syn keyword groovyJavaLangClass GroovyCodeSource
  syn keyword groovyJavaLangClass GroovyCodeSourcePermission
  syn keyword groovyJavaLangClass GroovyCodeVisitor
  syn keyword groovyJavaLangClass GroovyCollections
  syn keyword groovyJavaLangClass GroovyCompiledScript
  syn keyword groovyJavaLangClass GroovyConstructorDoc
  syn keyword groovyJavaLangClass GroovyDoc
  syn keyword groovyJavaLangClass GroovyDocErrorReporter
  syn keyword groovyJavaLangClass GroovyDocTemplateEngine
  syn keyword groovyJavaLangClass GroovyDocTemplateInfo
  syn keyword groovyJavaLangClass GroovyDocTool
  syn keyword groovyJavaLangClass GroovyDocWriter
  syn keyword groovyJavaLangClass GroovyEngine
  syn keyword groovyJavaLangClass GroovyException
  syn keyword groovyJavaLangClass GroovyExceptionInterface
  syn keyword groovyJavaLangClass GroovyExecutableMemberDoc
  syn keyword groovyJavaLangClass GroovyFieldDoc
  syn keyword groovyJavaLangClass GroovyFileFilter
  syn keyword groovyJavaLangClass GroovyFilter
  syn keyword groovyJavaLangClass GroovyInterceptable
  syn keyword groovyJavaLangClass GroovyInternalPosixParser
  syn keyword groovyJavaLangClass GroovyLogTestCase
  syn keyword groovyJavaLangClass GroovyMBean
  syn keyword groovyJavaLangClass GroovyMain
  syn keyword groovyJavaLangClass GroovyMemberDoc
  syn keyword groovyJavaLangClass GroovyMethodDoc
  syn keyword groovyJavaLangClass GroovyObject
  syn keyword groovyJavaLangClass GroovyObjectSupport
  syn keyword groovyJavaLangClass GroovyObjectWrapper
  syn keyword groovyJavaLangClass GroovyPackageDoc
  syn keyword groovyJavaLangClass GroovyParameter
  syn keyword groovyJavaLangClass GroovyPosixParser
  syn keyword groovyJavaLangClass GroovyPrintStream
  syn keyword groovyJavaLangClass GroovyPrintWriter
  syn keyword groovyJavaLangClass GroovyProgramElementDoc
  syn keyword groovyJavaLangClass GroovyRecognizer
  syn keyword groovyJavaLangClass GroovyResourceLoader
  syn keyword groovyJavaLangClass GroovyResultSet
  syn keyword groovyJavaLangClass GroovyResultSetExtension
  syn keyword groovyJavaLangClass GroovyResultSetProxy
  syn keyword groovyJavaLangClass GroovyRootDoc
  syn keyword groovyJavaLangClass GroovyRootDocBuilder
  syn keyword groovyJavaLangClass GroovyRowResult
  syn keyword groovyJavaLangClass GroovyRunner
  syn keyword groovyJavaLangClass GroovyRuntimeException
  syn keyword groovyJavaLangClass GroovyScriptEngine
  syn keyword groovyJavaLangClass GroovyScriptEngineFactory
  syn keyword groovyJavaLangClass GroovyScriptEngineImpl
  syn keyword groovyJavaLangClass GroovyServlet
  syn keyword groovyJavaLangClass GroovyShell
  syn keyword groovyJavaLangClass GroovyShellTestCase
  syn keyword groovyJavaLangClass GroovySocketServer
  syn keyword groovyJavaLangClass GroovySourceAST
  syn keyword groovyJavaLangClass GroovySourceToken
  syn keyword groovyJavaLangClass GroovyStarter
  syn keyword groovyJavaLangClass GroovySunClassLoader
  syn keyword groovyJavaLangClass GroovySyntaxCompletor
  syn keyword groovyJavaLangClass GroovySyntaxCompletor.CompletionCase
  syn keyword groovyJavaLangClass GroovySyntaxCompletor.InStringException
  syn keyword groovyJavaLangClass GroovySystem
  syn keyword groovyJavaLangClass GroovyTag
  syn keyword groovyJavaLangClass GroovyTestCase
  syn keyword groovyJavaLangClass GroovyTestSuite
  syn keyword groovyJavaLangClass GroovyTokenTypes
  syn keyword groovyJavaLangClass GroovyType
  syn keyword groovyJavaLangClass GroovyTypeCheckingExtensionSupport
  syn keyword groovyJavaLangClass GroovyTypeCheckingExtensionSupport.TypeCheckingDSL
  syn keyword groovyJavaLangClass Groovyc
  syn keyword groovyJavaLangClass GroovycTask
  syn keyword groovyJavaLangClass Groovydoc
  syn keyword groovyJavaLangClass Groovysh
  syn keyword groovyJavaLangClass HBoxFactory
  syn keyword groovyJavaLangClass HGlueFactory
  syn keyword groovyJavaLangClass HStrutFactory
  syn keyword groovyJavaLangClass HandleMetaClass
  syn keyword groovyJavaLangClass HasCleanup
  syn keyword groovyJavaLangClass HasRecursiveCalls
  syn keyword groovyJavaLangClass HashCodeHelper
  syn keyword groovyJavaLangClass HelpCommand
  syn keyword groovyJavaLangClass HelpFormatter
  syn keyword groovyJavaLangClass HistoryCommand
  syn keyword groovyJavaLangClass HistoryRecord
  syn keyword groovyJavaLangClass IFileNameFinder
  syn keyword groovyJavaLangClass IO
  syn keyword groovyJavaLangClass IO
  syn keyword groovyJavaLangClass IO.Verbosity
  syn keyword groovyJavaLangClass IOGroovyMethods
  syn keyword groovyJavaLangClass IdentifierCompletor
  syn keyword groovyJavaLangClass IfStatement
  syn keyword groovyJavaLangClass Ignore
  syn keyword groovyJavaLangClass IllegalPropertyAccessException
  syn keyword groovyJavaLangClass ImageIconFactory
  syn keyword groovyJavaLangClass Immutable
  syn keyword groovyJavaLangClass ImmutableASTTransformation
  syn keyword groovyJavaLangClass ImportCommand
  syn keyword groovyJavaLangClass ImportCompleter
  syn keyword groovyJavaLangClass ImportCustomizer
  syn keyword groovyJavaLangClass ImportCustomizerFactory
  syn keyword groovyJavaLangClass ImportNode
  syn keyword groovyJavaLangClass ImportsSyntaxCompletor
  syn keyword groovyJavaLangClass InOutParameter
  syn keyword groovyJavaLangClass InParameter
  syn keyword groovyJavaLangClass InWhileLoopWrapper
  syn keyword groovyJavaLangClass IncorrectClosureArgumentsException
  syn keyword groovyJavaLangClass IncorrectTypeHintException
  syn keyword groovyJavaLangClass IndentPrinter
  syn keyword groovyJavaLangClass IndexedProperty
  syn keyword groovyJavaLangClass IndexedPropertyASTTransformation
  syn keyword groovyJavaLangClass IndyBinHelper
  syn keyword groovyJavaLangClass IndyCallSiteWriter
  syn keyword groovyJavaLangClass IndyGuardsFiltersAndSignatures
  syn keyword groovyJavaLangClass IndyInterface
  syn keyword groovyJavaLangClass IndyInterface.CALL_TYPES
  syn keyword groovyJavaLangClass IndyMath
  syn keyword groovyJavaLangClass InfixKeywordSyntaxCompletor
  syn keyword groovyJavaLangClass InheritConstructors
  syn keyword groovyJavaLangClass InheritConstructorsASTTransformation
  syn keyword groovyJavaLangClass InitializerStrategy
  syn keyword groovyJavaLangClass InitializerStrategy.SET
  syn keyword groovyJavaLangClass InitializerStrategy.UNSET
  syn keyword groovyJavaLangClass InlinedASTCustomizerFactory
  syn keyword groovyJavaLangClass InnerClassCompletionVisitor
  syn keyword groovyJavaLangClass InnerClassNode
  syn keyword groovyJavaLangClass InnerClassVisitor
  syn keyword groovyJavaLangClass InnerClassVisitorHelper
  syn keyword groovyJavaLangClass InputStreamReaderSource
  syn keyword groovyJavaLangClass InspectCommand
  syn keyword groovyJavaLangClass InspectCommandCompletor
  syn keyword groovyJavaLangClass Inspector
  syn keyword groovyJavaLangClass Inspector.MemberComparator
  syn keyword groovyJavaLangClass IntRange
  syn keyword groovyJavaLangClass IntWrapper
  syn keyword groovyJavaLangClass IntegerArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass IntegerArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass IntegerCachedClass
  syn keyword groovyJavaLangClass IntegerMath
  syn keyword groovyJavaLangClass InteractiveShellRunner
  syn keyword groovyJavaLangClass Interceptor
  syn keyword groovyJavaLangClass InterfaceHelperClassNode
  syn keyword groovyJavaLangClass InternalFrameFactory
  syn keyword groovyJavaLangClass Interpreter
  syn keyword groovyJavaLangClass InvocationWriter
  syn keyword groovyJavaLangClass InvokeDynamicWriter
  syn keyword groovyJavaLangClass InvokerHelper
  syn keyword groovyJavaLangClass InvokerInvocationException
  syn keyword groovyJavaLangClass IteratorClosureAdapter
  syn keyword groovyJavaLangClass IvyGrabRecord
  syn keyword groovyJavaLangClass JComboBoxMetaMethods
  syn keyword groovyJavaLangClass JComboBoxProperties
  syn keyword groovyJavaLangClass JComponentProperties
  syn keyword groovyJavaLangClass JListElementsBinding
  syn keyword groovyJavaLangClass JListMetaMethods
  syn keyword groovyJavaLangClass JListProperties
  syn keyword groovyJavaLangClass JListSelectedElementBinding
  syn keyword groovyJavaLangClass JScrollBarProperties
  syn keyword groovyJavaLangClass JSliderProperties
  syn keyword groovyJavaLangClass JSpinnerProperties
  syn keyword groovyJavaLangClass JTableMetaMethods
  syn keyword groovyJavaLangClass JTableProperties
  syn keyword groovyJavaLangClass JTextComponentProperties
  syn keyword groovyJavaLangClass JUnit4Utils
  syn keyword groovyJavaLangClass Janitor
  syn keyword groovyJavaLangClass Java2GroovyConverter
  syn keyword groovyJavaLangClass Java2GroovyMain
  syn keyword groovyJavaLangClass Java5
  syn keyword groovyJavaLangClass Java6
  syn keyword groovyJavaLangClass Java7
  syn keyword groovyJavaLangClass JavaAwareCompilationUnit
  syn keyword groovyJavaLangClass JavaAwareResolveVisitor
  syn keyword groovyJavaLangClass JavaCompiler
  syn keyword groovyJavaLangClass JavaCompilerFactory
  syn keyword groovyJavaLangClass JavaLexer
  syn keyword groovyJavaLangClass JavaRecognizer
  syn keyword groovyJavaLangClass JavaStubCompilationUnit
  syn keyword groovyJavaLangClass JavaStubGenerator
  syn keyword groovyJavaLangClass JavaTokenTypes
  syn keyword groovyJavaLangClass JavacCompilerFactory
  syn keyword groovyJavaLangClass JavacJavaCompiler
  syn keyword groovyJavaLangClass JavadocAssertionTestBuilder
  syn keyword groovyJavaLangClass JavadocAssertionTestSuite
  syn keyword groovyJavaLangClass JmxAttributeInfoManager
  syn keyword groovyJavaLangClass JmxBeanExportFactory
  syn keyword groovyJavaLangClass JmxBeanFactory
  syn keyword groovyJavaLangClass JmxBeanInfoManager
  syn keyword groovyJavaLangClass JmxBeansFactory
  syn keyword groovyJavaLangClass JmxBuilder
  syn keyword groovyJavaLangClass JmxBuilderException
  syn keyword groovyJavaLangClass JmxBuilderModelMBean
  syn keyword groovyJavaLangClass JmxBuilderTools
  syn keyword groovyJavaLangClass JmxClientConnectorFactory
  syn keyword groovyJavaLangClass JmxEmitterFactory
  syn keyword groovyJavaLangClass JmxEventEmitter
  syn keyword groovyJavaLangClass JmxEventEmitterMBean
  syn keyword groovyJavaLangClass JmxEventListener
  syn keyword groovyJavaLangClass JmxListenerFactory
  syn keyword groovyJavaLangClass JmxMetaMapBuilder
  syn keyword groovyJavaLangClass JmxOperationInfoManager
  syn keyword groovyJavaLangClass JmxServerConnectorFactory
  syn keyword groovyJavaLangClass JmxTimerFactory
  syn keyword groovyJavaLangClass JsonBuilder
  syn keyword groovyJavaLangClass JsonDelegate
  syn keyword groovyJavaLangClass JsonException
  syn keyword groovyJavaLangClass JsonFastParser
  syn keyword groovyJavaLangClass JsonLexer
  syn keyword groovyJavaLangClass JsonOutput
  syn keyword groovyJavaLangClass JsonParser
  syn keyword groovyJavaLangClass JsonParserLax
  syn keyword groovyJavaLangClass JsonParserType
  syn keyword groovyJavaLangClass JsonParserUsingCharacterSource
  syn keyword groovyJavaLangClass JsonSlurper
  syn keyword groovyJavaLangClass JsonSlurperClassic
  syn keyword groovyJavaLangClass JsonStringDecoder
  syn keyword groovyJavaLangClass JsonToken
  syn keyword groovyJavaLangClass JsonTokenType
  syn keyword groovyJavaLangClass KeywordSyntaxCompletor
  syn keyword groovyJavaLangClass LRUCache
  syn keyword groovyJavaLangClass LabelVerifier
  syn keyword groovyJavaLangClass LayoutFactory
  syn keyword groovyJavaLangClass Lazy
  syn keyword groovyJavaLangClass LazyASTTransformation
  syn keyword groovyJavaLangClass LazyMap
  syn keyword groovyJavaLangClass LazyReference
  syn keyword groovyJavaLangClass LazyValueMap
  syn keyword groovyJavaLangClass LexerFrame
  syn keyword groovyJavaLangClass LineBorderFactory
  syn keyword groovyJavaLangClass LineColumn
  syn keyword groovyJavaLangClass LineColumnReader
  syn keyword groovyJavaLangClass LinkArgument
  syn keyword groovyJavaLangClass ListExpression
  syn keyword groovyJavaLangClass ListExpressionTransformer
  syn keyword groovyJavaLangClass ListFactory
  syn keyword groovyJavaLangClass ListHashMap
  syn keyword groovyJavaLangClass ListOfExpressionsExpression
  syn keyword groovyJavaLangClass ListWithDefault
  syn keyword groovyJavaLangClass ListWrapperListModel
  syn keyword groovyJavaLangClass ListenerList
  syn keyword groovyJavaLangClass ListenerListASTTransformation
  syn keyword groovyJavaLangClass LoadCommand
  syn keyword groovyJavaLangClass LoaderConfiguration
  syn keyword groovyJavaLangClass LocatedMessage
  syn keyword groovyJavaLangClass LockableObject
  syn keyword groovyJavaLangClass Log
  syn keyword groovyJavaLangClass Log.JavaUtilLoggingStrategy
  syn keyword groovyJavaLangClass Log4j
  syn keyword groovyJavaLangClass Log4j.Log4jLoggingStrategy
  syn keyword groovyJavaLangClass Log4j2
  syn keyword groovyJavaLangClass Log4j2.Log4j2LoggingStrategy
  syn keyword groovyJavaLangClass LogASTTransformation
  syn keyword groovyJavaLangClass LogASTTransformation.AbstractLoggingStrategy
  syn keyword groovyJavaLangClass LogASTTransformation.LoggingStrategy
  syn keyword groovyJavaLangClass Logger
  syn keyword groovyJavaLangClass LoggingHelper
  syn keyword groovyJavaLangClass LongArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass LongArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass LongCachedClass
  syn keyword groovyJavaLangClass LongMath
  syn keyword groovyJavaLangClass LongWrapper
  syn keyword groovyJavaLangClass LookAndFeelHelper
  syn keyword groovyJavaLangClass LoopingStatement
  syn keyword groovyJavaLangClass LooseExpectation
  syn keyword groovyJavaLangClass Main
  syn keyword groovyJavaLangClass ManagedConcurrentMap
  syn keyword groovyJavaLangClass ManagedConcurrentMap.Entry
  syn keyword groovyJavaLangClass ManagedConcurrentMap.EntryWithValue
  syn keyword groovyJavaLangClass ManagedConcurrentMap.Segment
  syn keyword groovyJavaLangClass ManagedConcurrentValueMap
  syn keyword groovyJavaLangClass ManagedDoubleKeyMap
  syn keyword groovyJavaLangClass ManagedDoubleKeyMap.Entry
  syn keyword groovyJavaLangClass ManagedLinkedList
  syn keyword groovyJavaLangClass ManagedReference
  syn keyword groovyJavaLangClass MapEntry
  syn keyword groovyJavaLangClass MapEntryExpression
  syn keyword groovyJavaLangClass MapEntryOrKeyValue
  syn keyword groovyJavaLangClass MapExpression
  syn keyword groovyJavaLangClass MapFactory
  syn keyword groovyJavaLangClass MapItemValue
  syn keyword groovyJavaLangClass MapWithDefault
  syn keyword groovyJavaLangClass MarkupBuilder
  syn keyword groovyJavaLangClass MarkupBuilderHelper
  syn keyword groovyJavaLangClass MarkupTemplateEngine
  syn keyword groovyJavaLangClass MarkupTemplateEngine.CachingTemplateResolver
  syn keyword groovyJavaLangClass MarkupTemplateEngine.DefaultTemplateResolver
  syn keyword groovyJavaLangClass MarkupTemplateEngine.TemplateResource
  syn keyword groovyJavaLangClass MarkupTemplateTypeCheckingExtension
  syn keyword groovyJavaLangClass MatteBorderFactory
  syn keyword groovyJavaLangClass Memoize
  syn keyword groovyJavaLangClass MemoizeCache
  syn keyword groovyJavaLangClass Memoized
  syn keyword groovyJavaLangClass MemoizedASTTransformation
  syn keyword groovyJavaLangClass Message
  syn keyword groovyJavaLangClass MessageSource
  syn keyword groovyJavaLangClass MetaArrayLengthProperty
  syn keyword groovyJavaLangClass MetaBeanProperty
  syn keyword groovyJavaLangClass MetaClass
  syn keyword groovyJavaLangClass MetaClassConstructorSite
  syn keyword groovyJavaLangClass MetaClassHelper
  syn keyword groovyJavaLangClass MetaClassImpl
  syn keyword groovyJavaLangClass MetaClassImpl.Index
  syn keyword groovyJavaLangClass MetaClassImpl.MetaConstructor
  syn keyword groovyJavaLangClass MetaClassRegistry
  syn keyword groovyJavaLangClass MetaClassRegistry.MetaClassCreationHandle
  syn keyword groovyJavaLangClass MetaClassRegistryChangeEvent
  syn keyword groovyJavaLangClass MetaClassRegistryChangeEventListener
  syn keyword groovyJavaLangClass MetaClassRegistryImpl
  syn keyword groovyJavaLangClass MetaClassSite
  syn keyword groovyJavaLangClass MetaExpandoProperty
  syn keyword groovyJavaLangClass MetaInfExtensionModule
  syn keyword groovyJavaLangClass MetaMethod
  syn keyword groovyJavaLangClass MetaMethodIndex
  syn keyword groovyJavaLangClass MetaMethodIndex.CacheEntry
  syn keyword groovyJavaLangClass MetaMethodIndex.Entry
  syn keyword groovyJavaLangClass MetaMethodIndex.EntryIterator
  syn keyword groovyJavaLangClass MetaMethodIndex.Header
  syn keyword groovyJavaLangClass MetaMethodSite
  syn keyword groovyJavaLangClass MetaObjectProtocol
  syn keyword groovyJavaLangClass MetaProperty
  syn keyword groovyJavaLangClass MethodCall
  syn keyword groovyJavaLangClass MethodCallExpression
  syn keyword groovyJavaLangClass MethodCallExpressionTransformer
  syn keyword groovyJavaLangClass MethodCaller
  syn keyword groovyJavaLangClass MethodCallerMultiAdapter
  syn keyword groovyJavaLangClass MethodClosure
  syn keyword groovyJavaLangClass MethodHelper
  syn keyword groovyJavaLangClass MethodKey
  syn keyword groovyJavaLangClass MethodMetaProperty
  syn keyword groovyJavaLangClass MethodMetaProperty.GetBeanMethodMetaProperty
  syn keyword groovyJavaLangClass MethodMetaProperty.GetMethodMetaProperty
  syn keyword groovyJavaLangClass MethodNode
  syn keyword groovyJavaLangClass MethodPointerExpression
  syn keyword groovyJavaLangClass MethodRankHelper
  syn keyword groovyJavaLangClass MethodSelectionException
  syn keyword groovyJavaLangClass MindMapPrinter
  syn keyword groovyJavaLangClass MissingClassException
  syn keyword groovyJavaLangClass MissingFieldException
  syn keyword groovyJavaLangClass MissingMethodException
  syn keyword groovyJavaLangClass MissingMethodExceptionNoStack
  syn keyword groovyJavaLangClass MissingMethodExecutionFailed
  syn keyword groovyJavaLangClass MissingPropertyException
  syn keyword groovyJavaLangClass MissingPropertyExceptionNoStack
  syn keyword groovyJavaLangClass MixedInMetaClass
  syn keyword groovyJavaLangClass Mixin
  syn keyword groovyJavaLangClass MixinASTTransformation
  syn keyword groovyJavaLangClass MixinInMetaClass
  syn keyword groovyJavaLangClass MixinInstanceMetaMethod
  syn keyword groovyJavaLangClass MixinInstanceMetaProperty
  syn keyword groovyJavaLangClass MixinNode
  syn keyword groovyJavaLangClass MockFor
  syn keyword groovyJavaLangClass MockInterceptor
  syn keyword groovyJavaLangClass MockOutputTool
  syn keyword groovyJavaLangClass MockProxyMetaClass
  syn keyword groovyJavaLangClass ModuleNode
  syn keyword groovyJavaLangClass MopWriter
  syn keyword groovyJavaLangClass MultipleCompilationErrorsException
  syn keyword groovyJavaLangClass MutableMetaClass
  syn keyword groovyJavaLangClass MutualPropertyBinding
  syn keyword groovyJavaLangClass NamedArgumentListExpression
  syn keyword groovyJavaLangClass Namespace
  syn keyword groovyJavaLangClass NamespaceAwareHashMap
  syn keyword groovyJavaLangClass NamespaceBuilder
  syn keyword groovyJavaLangClass NamespaceBuilderSupport
  syn keyword groovyJavaLangClass NavigablePropertiesCompleter
  syn keyword groovyJavaLangClass NestedValueModel
  syn keyword groovyJavaLangClass NewInstanceMetaMethod
  syn keyword groovyJavaLangClass NewMetaMethod
  syn keyword groovyJavaLangClass NewStaticMetaMethod
  syn keyword groovyJavaLangClass Newify
  syn keyword groovyJavaLangClass NewifyASTTransformation
  syn keyword groovyJavaLangClass NoChildren
  syn keyword groovyJavaLangClass NoExitSecurityManager
  syn keyword groovyJavaLangClass Node
  syn keyword groovyJavaLangClass NodeAsHTMLPrinter
  syn keyword groovyJavaLangClass NodeBuilder
  syn keyword groovyJavaLangClass NodeChild
  syn keyword groovyJavaLangClass NodeChildren
  syn keyword groovyJavaLangClass NodeCollector
  syn keyword groovyJavaLangClass NodeIterator
  syn keyword groovyJavaLangClass NodeList
  syn keyword groovyJavaLangClass NodeParents
  syn keyword groovyJavaLangClass NodePrinter
  syn keyword groovyJavaLangClass NonEmptySequence
  syn keyword groovyJavaLangClass NotExpression
  syn keyword groovyJavaLangClass NotYetImplemented
  syn keyword groovyJavaLangClass NotYetImplementedASTTransformation
  syn keyword groovyJavaLangClass NullCallSite
  syn keyword groovyJavaLangClass NullObject
  syn keyword groovyJavaLangClass NullProtectionStorage
  syn keyword groovyJavaLangClass NullWriter
  syn keyword groovyJavaLangClass NumberAwareComparator
  syn keyword groovyJavaLangClass NumberCachedClass
  syn keyword groovyJavaLangClass NumberMath
  syn keyword groovyJavaLangClass NumberMathModificationInfo
  syn keyword groovyJavaLangClass NumberNumberDiv
  syn keyword groovyJavaLangClass NumberNumberMetaMethod
  syn keyword groovyJavaLangClass NumberNumberMetaMethod.NumberNumberCallSite
  syn keyword groovyJavaLangClass NumberNumberMinus
  syn keyword groovyJavaLangClass NumberNumberMultiply
  syn keyword groovyJavaLangClass NumberNumberPlus
  syn keyword groovyJavaLangClass NumberValue
  syn keyword groovyJavaLangClass Numbers
  syn keyword groovyJavaLangClass ObjectArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass ObjectArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass ObjectBrowser
  syn keyword groovyJavaLangClass ObjectCachedClass
  syn keyword groovyJavaLangClass ObjectGraphBuilder
  syn keyword groovyJavaLangClass ObjectGraphBuilder.ChildPropertySetter
  syn keyword groovyJavaLangClass ObjectGraphBuilder.ClassNameResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.DefaultChildPropertySetter
  syn keyword groovyJavaLangClass ObjectGraphBuilder.DefaultClassNameResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.DefaultIdentifierResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.DefaultNewInstanceResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.DefaultReferenceResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.DefaultRelationNameResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.IdentifierResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.NewInstanceResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.ReferenceResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.ReflectionClassNameResolver
  syn keyword groovyJavaLangClass ObjectGraphBuilder.RelationNameResolver
  syn keyword groovyJavaLangClass ObjectRange
  syn keyword groovyJavaLangClass ObservableList
  syn keyword groovyJavaLangClass ObservableList.ChangeType
  syn keyword groovyJavaLangClass ObservableList.ElementAddedEvent
  syn keyword groovyJavaLangClass ObservableList.ElementClearedEvent
  syn keyword groovyJavaLangClass ObservableList.ElementEvent
  syn keyword groovyJavaLangClass ObservableList.ElementRemovedEvent
  syn keyword groovyJavaLangClass ObservableList.ElementUpdatedEvent
  syn keyword groovyJavaLangClass ObservableList.MultiElementAddedEvent
  syn keyword groovyJavaLangClass ObservableList.MultiElementRemovedEvent
  syn keyword groovyJavaLangClass ObservableList.ObservableIterator
  syn keyword groovyJavaLangClass ObservableList.ObservableListIterator
  syn keyword groovyJavaLangClass ObservableMap
  syn keyword groovyJavaLangClass ObservableMap.ChangeType
  syn keyword groovyJavaLangClass ObservableMap.MultiPropertyEvent
  syn keyword groovyJavaLangClass ObservableMap.PropertyAddedEvent
  syn keyword groovyJavaLangClass ObservableMap.PropertyClearedEvent
  syn keyword groovyJavaLangClass ObservableMap.PropertyEvent
  syn keyword groovyJavaLangClass ObservableMap.PropertyRemovedEvent
  syn keyword groovyJavaLangClass ObservableMap.PropertyUpdatedEvent
  syn keyword groovyJavaLangClass ObservableSet
  syn keyword groovyJavaLangClass ObservableSet.ChangeType
  syn keyword groovyJavaLangClass ObservableSet.ElementAddedEvent
  syn keyword groovyJavaLangClass ObservableSet.ElementClearedEvent
  syn keyword groovyJavaLangClass ObservableSet.ElementEvent
  syn keyword groovyJavaLangClass ObservableSet.ElementRemovedEvent
  syn keyword groovyJavaLangClass ObservableSet.MultiElementAddedEvent
  syn keyword groovyJavaLangClass ObservableSet.MultiElementRemovedEvent
  syn keyword groovyJavaLangClass ObservableSet.ObservableIterator
  syn keyword groovyJavaLangClass OperandStack
  syn keyword groovyJavaLangClass OptimizerVisitor
  syn keyword groovyJavaLangClass OptimizingStatementWriter
  syn keyword groovyJavaLangClass OptimizingStatementWriter.ClassNodeSkip
  syn keyword groovyJavaLangClass OptimizingStatementWriter.StatementMeta
  syn keyword groovyJavaLangClass OptionAccessor
  syn keyword groovyJavaLangClass OrderBy
  syn keyword groovyJavaLangClass OutParameter
  syn keyword groovyJavaLangClass OutputTool
  syn keyword groovyJavaLangClass OutputTransforms
  syn keyword groovyJavaLangClass OwnedMetaClass
  syn keyword groovyJavaLangClass PackageHelper
  syn keyword groovyJavaLangClass PackageNode
  syn keyword groovyJavaLangClass PackageScope
  syn keyword groovyJavaLangClass PackageScopeASTTransformation
  syn keyword groovyJavaLangClass PackageScopeTarget
  syn keyword groovyJavaLangClass Parameter
  syn keyword groovyJavaLangClass ParameterArray
  syn keyword groovyJavaLangClass ParameterTypes
  syn keyword groovyJavaLangClass ParseCode
  syn keyword groovyJavaLangClass ParseStatus
  syn keyword groovyJavaLangClass Parser
  syn keyword groovyJavaLangClass ParserException
  syn keyword groovyJavaLangClass ParserPlugin
  syn keyword groovyJavaLangClass ParserPluginFactory
  syn keyword groovyJavaLangClass Parsing
  syn keyword groovyJavaLangClass PerInstancePojoMetaClassSite
  syn keyword groovyJavaLangClass PermutationGenerator
  syn keyword groovyJavaLangClass Phases
  syn keyword groovyJavaLangClass PickAnyArgumentHint
  syn keyword groovyJavaLangClass PlatformLineWriter
  syn keyword groovyJavaLangClass PluginDefaultGroovyMethods
  syn keyword groovyJavaLangClass PogoGetPropertySite
  syn keyword groovyJavaLangClass PogoInterceptableSite
  syn keyword groovyJavaLangClass PogoMetaClassGetPropertySite
  syn keyword groovyJavaLangClass PogoMetaClassSite
  syn keyword groovyJavaLangClass PogoMetaMethodSite
  syn keyword groovyJavaLangClass PogoMetaMethodSite.PogoCachedMethodSite
  syn keyword groovyJavaLangClass PogoMetaMethodSite.PogoCachedMethodSiteNoUnwrap
  syn keyword groovyJavaLangClass PogoMetaMethodSite.PogoCachedMethodSiteNoUnwrapNoCoerce
  syn keyword groovyJavaLangClass PogoMetaMethodSite.PogoMetaMethodSiteNoUnwrap
  syn keyword groovyJavaLangClass PogoMetaMethodSite.PogoMetaMethodSiteNoUnwrapNoCoerce
  syn keyword groovyJavaLangClass PojoMetaClassGetPropertySite
  syn keyword groovyJavaLangClass PojoMetaClassSite
  syn keyword groovyJavaLangClass PojoMetaMethodSite
  syn keyword groovyJavaLangClass PojoMetaMethodSite.PojoCachedMethodSite
  syn keyword groovyJavaLangClass PojoMetaMethodSite.PojoCachedMethodSiteNoUnwrap
  syn keyword groovyJavaLangClass PojoMetaMethodSite.PojoCachedMethodSiteNoUnwrapNoCoerce
  syn keyword groovyJavaLangClass PojoMetaMethodSite.PojoMetaMethodSiteNoUnwrap
  syn keyword groovyJavaLangClass PojoMetaMethodSite.PojoMetaMethodSiteNoUnwrapNoCoerce
  syn keyword groovyJavaLangClass PojoWrapper
  syn keyword groovyJavaLangClass PostCompletionFactory
  syn keyword groovyJavaLangClass PostfixExpression
  syn keyword groovyJavaLangClass PowerAssertionError
  syn keyword groovyJavaLangClass PreJava2GroovyConverter
  syn keyword groovyJavaLangClass PreOrderTraversal
  syn keyword groovyJavaLangClass Preferences
  syn keyword groovyJavaLangClass PrefixExpression
  syn keyword groovyJavaLangClass ProcessGroovyMethods
  syn keyword groovyJavaLangClass ProcessGroovyMethods.ProcessRunner
  syn keyword groovyJavaLangClass ProcessingUnit
  syn keyword groovyJavaLangClass PropertiesModuleFactory
  syn keyword groovyJavaLangClass PropertyAccessInterceptor
  syn keyword groovyJavaLangClass PropertyAccessor
  syn keyword groovyJavaLangClass PropertyBinding
  syn keyword groovyJavaLangClass PropertyBinding.UpdateStrategy
  syn keyword groovyJavaLangClass PropertyChangeProxyTargetBinding
  syn keyword groovyJavaLangClass PropertyColumnFactory
  syn keyword groovyJavaLangClass PropertyExpression
  syn keyword groovyJavaLangClass PropertyModel
  syn keyword groovyJavaLangClass PropertyNode
  syn keyword groovyJavaLangClass PropertyPathFullBinding
  syn keyword groovyJavaLangClass PropertyReader
  syn keyword groovyJavaLangClass PropertyValue
  syn keyword groovyJavaLangClass PropertyWriter
  syn keyword groovyJavaLangClass Proxy
  syn keyword groovyJavaLangClass ProxyGenerator
  syn keyword groovyJavaLangClass ProxyGeneratorAdapter
  syn keyword groovyJavaLangClass ProxyMetaClass
  syn keyword groovyJavaLangClass PurgeCommand
  syn keyword groovyJavaLangClass QName
  syn keyword groovyJavaLangClass Range
  syn keyword groovyJavaLangClass RangeExpression
  syn keyword groovyJavaLangClass RangeExpressionTransformer
  syn keyword groovyJavaLangClass RangeInfo
  syn keyword groovyJavaLangClass ReadException
  syn keyword groovyJavaLangClass ReadOnlyPropertyException
  syn keyword groovyJavaLangClass ReadWriteLockASTTransformation
  syn keyword groovyJavaLangClass ReaderCharacterSource
  syn keyword groovyJavaLangClass ReaderSource
  syn keyword groovyJavaLangClass Receiver
  syn keyword groovyJavaLangClass RecordCommand
  syn keyword groovyJavaLangClass RecursivenessTester
  syn keyword groovyJavaLangClass Reduction
  syn keyword groovyJavaLangClass Reference
  syn keyword groovyJavaLangClass ReferenceBundle
  syn keyword groovyJavaLangClass ReferenceManager
  syn keyword groovyJavaLangClass ReferenceType
  syn keyword groovyJavaLangClass ReflectionCache
  syn keyword groovyJavaLangClass ReflectionCompletor
  syn keyword groovyJavaLangClass ReflectionMetaMethod
  syn keyword groovyJavaLangClass ReflectionMethodInvoker
  syn keyword groovyJavaLangClass ReflectionUtils
  syn keyword groovyJavaLangClass Reflector
  syn keyword groovyJavaLangClass ReflectorLoader
  syn keyword groovyJavaLangClass RegexSupport
  syn keyword groovyJavaLangClass RegisterCommand
  syn keyword groovyJavaLangClass RelaxedParser
  syn keyword groovyJavaLangClass ReleaseInfo
  syn keyword groovyJavaLangClass RendererFactory
  syn keyword groovyJavaLangClass RendererUpdateFactory
  syn keyword groovyJavaLangClass ReplacementNode
  syn keyword groovyJavaLangClass ResolveVisitor
  syn keyword groovyJavaLangClass ResourceConnector
  syn keyword groovyJavaLangClass ResourceException
  syn keyword groovyJavaLangClass ResourceGroovyMethods
  syn keyword groovyJavaLangClass ResourceManager
  syn keyword groovyJavaLangClass ResultSetMetaDataWrapper
  syn keyword groovyJavaLangClass ResultSetOutParameter
  syn keyword groovyJavaLangClass ReturnAdder
  syn keyword groovyJavaLangClass ReturnAdder.ReturnStatementListener
  syn keyword groovyJavaLangClass ReturnAdderForClosures
  syn keyword groovyJavaLangClass ReturnStatement
  syn keyword groovyJavaLangClass ReturnStatementToIterationConverter
  syn keyword groovyJavaLangClass ReverseListIterator
  syn keyword groovyJavaLangClass RichActionWidgetFactory
  syn keyword groovyJavaLangClass RigidAreaFactory
  syn keyword groovyJavaLangClass RigidParser
  syn keyword groovyJavaLangClass RootLoader
  syn keyword groovyJavaLangClass RootLoaderRef
  syn keyword groovyJavaLangClass RootPaneContainerFactory
  syn keyword groovyJavaLangClass RuntimeParserException
  syn keyword groovyJavaLangClass SAXBuilder
  syn keyword groovyJavaLangClass SaveCommand
  syn keyword groovyJavaLangClass Script
  syn keyword groovyJavaLangClass ScriptBytecodeAdapter
  syn keyword groovyJavaLangClass ScriptException
  syn keyword groovyJavaLangClass ScriptExtensions
  syn keyword groovyJavaLangClass ScriptReference
  syn keyword groovyJavaLangClass ScriptStaticExtensions
  syn keyword groovyJavaLangClass ScriptTestAdapter
  syn keyword groovyJavaLangClass ScriptToTreeNodeAdapter
  syn keyword groovyJavaLangClass ScrollPaneFactory
  syn keyword groovyJavaLangClass SecondParam
  syn keyword groovyJavaLangClass SecondParam.Component
  syn keyword groovyJavaLangClass SecondParam.FirstGenericType
  syn keyword groovyJavaLangClass SecondParam.SecondGenericType
  syn keyword groovyJavaLangClass SecondParam.ThirdGenericType
  syn keyword groovyJavaLangClass SecureASTCustomizer
  syn keyword groovyJavaLangClass SecureASTCustomizer.ExpressionChecker
  syn keyword groovyJavaLangClass SecureASTCustomizer.StatementChecker
  syn keyword groovyJavaLangClass SecureASTCustomizerFactory
  syn keyword groovyJavaLangClass Selector
  syn keyword groovyJavaLangClass SeparatorFactory
  syn keyword groovyJavaLangClass Sequence
  syn keyword groovyJavaLangClass ServletBinding
  syn keyword groovyJavaLangClass ServletCategory
  syn keyword groovyJavaLangClass SetCommand
  syn keyword groovyJavaLangClass ShadowCommand
  syn keyword groovyJavaLangClass SharedVariableCollector
  syn keyword groovyJavaLangClass Shell
  syn keyword groovyJavaLangClass ShellRunner
  syn keyword groovyJavaLangClass ShortArrayGetAtMetaMethod
  syn keyword groovyJavaLangClass ShortArrayPutAtMetaMethod
  syn keyword groovyJavaLangClass ShortCachedClass
  syn keyword groovyJavaLangClass ShortTypeHandling
  syn keyword groovyJavaLangClass ShortWrapper
  syn keyword groovyJavaLangClass ShowCommand
  syn keyword groovyJavaLangClass SignatureCodec
  syn keyword groovyJavaLangClass SignatureCodecVersion1
  syn keyword groovyJavaLangClass SimpleCache
  syn keyword groovyJavaLangClass SimpleCompletor
  syn keyword groovyJavaLangClass SimpleExtensionModule
  syn keyword groovyJavaLangClass SimpleGroovyAbstractableElementDoc
  syn keyword groovyJavaLangClass SimpleGroovyAnnotationRef
  syn keyword groovyJavaLangClass SimpleGroovyClassDoc
  syn keyword groovyJavaLangClass SimpleGroovyClassDocAssembler
  syn keyword groovyJavaLangClass SimpleGroovyConstructorDoc
  syn keyword groovyJavaLangClass SimpleGroovyDoc
  syn keyword groovyJavaLangClass SimpleGroovyExecutableMemberDoc
  syn keyword groovyJavaLangClass SimpleGroovyFieldDoc
  syn keyword groovyJavaLangClass SimpleGroovyMemberDoc
  syn keyword groovyJavaLangClass SimpleGroovyMethodDoc
  syn keyword groovyJavaLangClass SimpleGroovyPackageDoc
  syn keyword groovyJavaLangClass SimpleGroovyParameter
  syn keyword groovyJavaLangClass SimpleGroovyProgramElementDoc
  syn keyword groovyJavaLangClass SimpleGroovyRootDoc
  syn keyword groovyJavaLangClass SimpleGroovyTag
  syn keyword groovyJavaLangClass SimpleGroovyType
  syn keyword groovyJavaLangClass SimpleMessage
  syn keyword groovyJavaLangClass SimpleStrategy
  syn keyword groovyJavaLangClass SimpleTemplateEngine
  syn keyword groovyJavaLangClass SimpleType
  syn keyword groovyJavaLangClass SingleKeyHashMap
  syn keyword groovyJavaLangClass SingleKeyHashMap.Copier
  syn keyword groovyJavaLangClass SingleKeyHashMap.Entry
  syn keyword groovyJavaLangClass SingleSignatureClosureHint
  syn keyword groovyJavaLangClass Singleton
  syn keyword groovyJavaLangClass SingletonASTTransformation
  syn keyword groovyJavaLangClass Slf4j
  syn keyword groovyJavaLangClass Slf4j.Slf4jLoggingStrategy
  syn keyword groovyJavaLangClass SocketGroovyMethods
  syn keyword groovyJavaLangClass Sortable
  syn keyword groovyJavaLangClass SortableASTTransformation
  syn keyword groovyJavaLangClass SourceAwareCustomizer
  syn keyword groovyJavaLangClass SourceAwareCustomizerFactory
  syn keyword groovyJavaLangClass SourceAwareCustomizerFactory.SourceOptions
  syn keyword groovyJavaLangClass SourceBinding
  syn keyword groovyJavaLangClass SourceBuffer
  syn keyword groovyJavaLangClass SourceCodeTraversal
  syn keyword groovyJavaLangClass SourceExtensionHandler
  syn keyword groovyJavaLangClass SourceInfo
  syn keyword groovyJavaLangClass SourcePrinter
  syn keyword groovyJavaLangClass SourceText
  syn keyword groovyJavaLangClass SourceTextNotAvailableException
  syn keyword groovyJavaLangClass SourceURI
  syn keyword groovyJavaLangClass SourceURIASTTransformation
  syn keyword groovyJavaLangClass SourceUnit
  syn keyword groovyJavaLangClass SplitPaneFactory
  syn keyword groovyJavaLangClass SpreadExpression
  syn keyword groovyJavaLangClass SpreadListEvaluatingException
  syn keyword groovyJavaLangClass SpreadMap
  syn keyword groovyJavaLangClass SpreadMapEvaluatingException
  syn keyword groovyJavaLangClass SpreadMapExpression
  syn keyword groovyJavaLangClass Sql
  syn keyword groovyJavaLangClass Sql.AbstractQueryCommand
  syn keyword groovyJavaLangClass SqlGroovyMethods
  syn keyword groovyJavaLangClass SqlOrderByVisitor
  syn keyword groovyJavaLangClass SqlWhereVisitor
  syn keyword groovyJavaLangClass SqlWithParams
  syn keyword groovyJavaLangClass StackTraceUtils
  syn keyword groovyJavaLangClass StandardPropertiesModuleFactory
  syn keyword groovyJavaLangClass Statement
  syn keyword groovyJavaLangClass StatementMetaTypeChooser
  syn keyword groovyJavaLangClass StatementReplacer
  syn keyword groovyJavaLangClass StatementWriter
  syn keyword groovyJavaLangClass StaticCompilationMetadataKeys
  syn keyword groovyJavaLangClass StaticCompilationTransformer
  syn keyword groovyJavaLangClass StaticCompilationVisitor
  syn keyword groovyJavaLangClass StaticCompileTransformation
  syn keyword groovyJavaLangClass StaticImportVisitor
  syn keyword groovyJavaLangClass StaticInvocationWriter
  syn keyword groovyJavaLangClass StaticMetaClassSite
  syn keyword groovyJavaLangClass StaticMetaMethodSite
  syn keyword groovyJavaLangClass StaticMetaMethodSite.StaticMetaMethodSiteNoUnwrap
  syn keyword groovyJavaLangClass StaticMetaMethodSite.StaticMetaMethodSiteNoUnwrapNoCoerce
  syn keyword groovyJavaLangClass StaticMethodCallExpression
  syn keyword groovyJavaLangClass StaticMethodCallExpressionTransformer
  syn keyword groovyJavaLangClass StaticTypeCheckingSupport
  syn keyword groovyJavaLangClass StaticTypeCheckingVisitor
  syn keyword groovyJavaLangClass StaticTypeCheckingVisitor.SignatureCodecFactory
  syn keyword groovyJavaLangClass StaticTypeCheckingVisitor.VariableExpressionTypeMemoizer
  syn keyword groovyJavaLangClass StaticTypesBinaryExpressionMultiTypeDispatcher
  syn keyword groovyJavaLangClass StaticTypesCallSiteWriter
  syn keyword groovyJavaLangClass StaticTypesClosureWriter
  syn keyword groovyJavaLangClass StaticTypesMarker
  syn keyword groovyJavaLangClass StaticTypesStatementWriter
  syn keyword groovyJavaLangClass StaticTypesTransformation
  syn keyword groovyJavaLangClass StaticTypesTypeChooser
  syn keyword groovyJavaLangClass StaticTypesUnaryExpressionHelper
  syn keyword groovyJavaLangClass StaticTypesWriterController
  syn keyword groovyJavaLangClass StaticTypesWriterControllerFactoryImpl
  syn keyword groovyJavaLangClass StaticVerifier
  syn keyword groovyJavaLangClass StaxBuilder
  syn keyword groovyJavaLangClass StreamingDOMBuilder
  syn keyword groovyJavaLangClass StreamingJsonBuilder
  syn keyword groovyJavaLangClass StreamingJsonDelegate
  syn keyword groovyJavaLangClass StreamingMarkupBuilder
  syn keyword groovyJavaLangClass StreamingMarkupWriter
  syn keyword groovyJavaLangClass StreamingSAXBuilder
  syn keyword groovyJavaLangClass StrictExpectation
  syn keyword groovyJavaLangClass StricterArgumentCompleter
  syn keyword groovyJavaLangClass StringBufferWriter
  syn keyword groovyJavaLangClass StringCachedClass
  syn keyword groovyJavaLangClass StringEscapeUtils
  syn keyword groovyJavaLangClass StringGroovyMethods
  syn keyword groovyJavaLangClass StringHelper
  syn keyword groovyJavaLangClass StringReaderSource
  syn keyword groovyJavaLangClass StringSetMap
  syn keyword groovyJavaLangClass StringTestUtil
  syn keyword groovyJavaLangClass StringUtil
  syn keyword groovyJavaLangClass StringWriterIOException
  syn keyword groovyJavaLangClass StructuredSyntaxDocumentFilter
  syn keyword groovyJavaLangClass StructuredSyntaxDocumentFilter.LexerNode
  syn keyword groovyJavaLangClass StructuredSyntaxDocumentFilter.MultiLineRun
  syn keyword groovyJavaLangClass StructuredSyntaxHandler
  syn keyword groovyJavaLangClass StructuredSyntaxResources
  syn keyword groovyJavaLangClass StubFor
  syn keyword groovyJavaLangClass SunClassLoader
  syn keyword groovyJavaLangClass SwingBorderFactory
  syn keyword groovyJavaLangClass SwingBuilder
  syn keyword groovyJavaLangClass SwingGroovyMethods
  syn keyword groovyJavaLangClass SwingTimerTriggerBinding
  syn keyword groovyJavaLangClass SwingTreeNodeMaker
  syn keyword groovyJavaLangClass SwitchStatement
  syn keyword groovyJavaLangClass Synchronized
  syn keyword groovyJavaLangClass SynchronizedASTTransformation
  syn keyword groovyJavaLangClass SynchronizedStatement
  syn keyword groovyJavaLangClass SyntaxErrorMessage
  syn keyword groovyJavaLangClass SyntaxException
  syn keyword groovyJavaLangClass SystemOutputInterceptor
  syn keyword groovyJavaLangClass TDFactory
  syn keyword groovyJavaLangClass TRFactory
  syn keyword groovyJavaLangClass TabbedPaneFactory
  syn keyword groovyJavaLangClass TableFactory
  syn keyword groovyJavaLangClass TableLayout
  syn keyword groovyJavaLangClass TableLayoutCell
  syn keyword groovyJavaLangClass TableLayoutFactory
  syn keyword groovyJavaLangClass TableLayoutRow
  syn keyword groovyJavaLangClass TableMap
  syn keyword groovyJavaLangClass TableModelFactory
  syn keyword groovyJavaLangClass TableSorter
  syn keyword groovyJavaLangClass TagLibAdapter
  syn keyword groovyJavaLangClass TailRecursive
  syn keyword groovyJavaLangClass TailRecursiveASTTransformation
  syn keyword groovyJavaLangClass TargetBinding
  syn keyword groovyJavaLangClass Template
  syn keyword groovyJavaLangClass TemplateConfiguration
  syn keyword groovyJavaLangClass TemplateEngine
  syn keyword groovyJavaLangClass TemplateResolver
  syn keyword groovyJavaLangClass TemplateServlet
  syn keyword groovyJavaLangClass TemporaryMethodKey
  syn keyword groovyJavaLangClass TernaryExpression
  syn keyword groovyJavaLangClass TernaryToIfStatementConverter
  syn keyword groovyJavaLangClass TestHarnessClassLoader
  syn keyword groovyJavaLangClass TestHarnessOperation
  syn keyword groovyJavaLangClass TestNgRunner
  syn keyword groovyJavaLangClass TextArgWidgetFactory
  syn keyword groovyJavaLangClass TextEditor
  syn keyword groovyJavaLangClass TextNode
  syn keyword groovyJavaLangClass TextTreeNodeMaker
  syn keyword groovyJavaLangClass TextUndoManager
  syn keyword groovyJavaLangClass ThirdParam
  syn keyword groovyJavaLangClass ThirdParam.Component
  syn keyword groovyJavaLangClass ThirdParam.FirstGenericType
  syn keyword groovyJavaLangClass ThirdParam.SecondGenericType
  syn keyword groovyJavaLangClass ThirdParam.ThirdGenericType
  syn keyword groovyJavaLangClass ThreadInterrupt
  syn keyword groovyJavaLangClass ThreadInterruptibleASTTransformation
  syn keyword groovyJavaLangClass ThreadManagedMetaBeanProperty
  syn keyword groovyJavaLangClass ThrowStatement
  syn keyword groovyJavaLangClass TimeCategory
  syn keyword groovyJavaLangClass TimeDatumDependentDuration
  syn keyword groovyJavaLangClass TimeDuration
  syn keyword groovyJavaLangClass TimedInterrupt
  syn keyword groovyJavaLangClass TimedInterruptibleASTTransformation
  syn keyword groovyJavaLangClass TitledBorderFactory
  syn keyword groovyJavaLangClass ToString
  syn keyword groovyJavaLangClass ToStringASTTransformation
  syn keyword groovyJavaLangClass Token
  syn keyword groovyJavaLangClass TokenException
  syn keyword groovyJavaLangClass TokenMismatchException
  syn keyword groovyJavaLangClass TracingInterceptor
  syn keyword groovyJavaLangClass Trait
  syn keyword groovyJavaLangClass TraitASTTransformation
  syn keyword groovyJavaLangClass TraitComposer
  syn keyword groovyJavaLangClass TraitTypeCheckingExtension
  syn keyword groovyJavaLangClass Traits
  syn keyword groovyJavaLangClass Traits.Implemented
  syn keyword groovyJavaLangClass Traits.TraitBridge
  syn keyword groovyJavaLangClass TransformMetaMethod
  syn keyword groovyJavaLangClass TransformTestHelper
  syn keyword groovyJavaLangClass TraversalHelper
  syn keyword groovyJavaLangClass TreeNodeBuildingNodeOperation
  syn keyword groovyJavaLangClass TreeNodeBuildingVisitor
  syn keyword groovyJavaLangClass TreeNodeWithProperties
  syn keyword groovyJavaLangClass TriggerBinding
  syn keyword groovyJavaLangClass TripleKeyHashMap
  syn keyword groovyJavaLangClass TripleKeyHashMap.Entry
  syn keyword groovyJavaLangClass TryCatchStatement
  syn keyword groovyJavaLangClass Tuple
  syn keyword groovyJavaLangClass TupleConstructor
  syn keyword groovyJavaLangClass TupleConstructorASTTransformation
  syn keyword groovyJavaLangClass TupleExpression
  syn keyword groovyJavaLangClass Type
  syn keyword groovyJavaLangClass TypeChecked
  syn keyword groovyJavaLangClass TypeChecked.TypeCheckingInfo
  syn keyword groovyJavaLangClass TypeCheckingContext
  syn keyword groovyJavaLangClass TypeCheckingContext.EnclosingClosure
  syn keyword groovyJavaLangClass TypeCheckingExtension
  syn keyword groovyJavaLangClass TypeCheckingMode
  syn keyword groovyJavaLangClass TypeChooser
  syn keyword groovyJavaLangClass TypeHelper
  syn keyword groovyJavaLangClass TypeTransformers
  syn keyword groovyJavaLangClass Types
  syn keyword groovyJavaLangClass URLReaderSource
  syn keyword groovyJavaLangClass UberCompileTask
  syn keyword groovyJavaLangClass UnaryExpressionHelper
  syn keyword groovyJavaLangClass UnaryMinusExpression
  syn keyword groovyJavaLangClass UnaryPlusExpression
  syn keyword groovyJavaLangClass Undefined
  syn keyword groovyJavaLangClass Undefined.CLASS
  syn keyword groovyJavaLangClass UnicodeEscapingReader
  syn keyword groovyJavaLangClass UnicodeLexerSharedInputState
  syn keyword groovyJavaLangClass UnlimitedConcurrentCache
  syn keyword groovyJavaLangClass UsedVariableTracker
  syn keyword groovyJavaLangClass Utilities
  syn keyword groovyJavaLangClass VBoxFactory
  syn keyword groovyJavaLangClass VGlueFactory
  syn keyword groovyJavaLangClass VMPlugin
  syn keyword groovyJavaLangClass VMPluginFactory
  syn keyword groovyJavaLangClass VStrutFactory
  syn keyword groovyJavaLangClass Value
  syn keyword groovyJavaLangClass Value
  syn keyword groovyJavaLangClass ValueContainer
  syn keyword groovyJavaLangClass ValueHolder
  syn keyword groovyJavaLangClass ValueList
  syn keyword groovyJavaLangClass ValueMap
  syn keyword groovyJavaLangClass ValueMapImpl
  syn keyword groovyJavaLangClass ValueModel
  syn keyword groovyJavaLangClass ValueRecorder
  syn keyword groovyJavaLangClass Variable
  syn keyword groovyJavaLangClass VariableAccessReplacer
  syn keyword groovyJavaLangClass VariableExpression
  syn keyword groovyJavaLangClass VariableExpressionReplacer
  syn keyword groovyJavaLangClass VariableExpressionTransformer
  syn keyword groovyJavaLangClass VariableExpressionTransformer
  syn keyword groovyJavaLangClass VariableReplacedListener
  syn keyword groovyJavaLangClass VariableScope
  syn keyword groovyJavaLangClass VariableScopeVisitor
  syn keyword groovyJavaLangClass VariableSlotLoader
  syn keyword groovyJavaLangClass VariableSyntaxCompletor
  syn keyword groovyJavaLangClass Verifier
  syn keyword groovyJavaLangClass Verifier.DefaultArgsAction
  syn keyword groovyJavaLangClass VerifierCodeVisitor
  syn keyword groovyJavaLangClass VerifyClass
  syn keyword groovyJavaLangClass Vetoable
  syn keyword groovyJavaLangClass VetoableASTTransformation
  syn keyword groovyJavaLangClass Visitor
  syn keyword groovyJavaLangClass VisitorAdapter
  syn keyword groovyJavaLangClass WarningMessage
  syn keyword groovyJavaLangClass WhileStatement
  syn keyword groovyJavaLangClass WideningCategories
  syn keyword groovyJavaLangClass WideningCategories.LowestUpperBoundClassNode
  syn keyword groovyJavaLangClass WidgetFactory
  syn keyword groovyJavaLangClass WindowFactory
  syn keyword groovyJavaLangClass WithReadLock
  syn keyword groovyJavaLangClass WithWriteLock
  syn keyword groovyJavaLangClass WrappedInputStream
  syn keyword groovyJavaLangClass Wrapper
  syn keyword groovyJavaLangClass Writable
  syn keyword groovyJavaLangClass WritableFile
  syn keyword groovyJavaLangClass WritablePath
  syn keyword groovyJavaLangClass WriterController
  syn keyword groovyJavaLangClass WriterControllerFactory
  syn keyword groovyJavaLangClass XmlCommandRegistrar
  syn keyword groovyJavaLangClass XmlGroovyMethods
  syn keyword groovyJavaLangClass XmlNodePrinter
  syn keyword groovyJavaLangClass XmlNodePrinter.NamespaceContext
  syn keyword groovyJavaLangClass XmlParser
  syn keyword groovyJavaLangClass XmlSlurper
  syn keyword groovyJavaLangClass XmlTemplateEngine
  syn keyword groovyJavaLangClass XmlUtil
  syn keyword groovyJavaLangClass genArrayAccess
  syn keyword groovyJavaLangClass genArrays
  syn keyword groovyJavaLangClass genDgmMath
  syn keyword groovyJavaLangClass genMathModification
  
  syn keyword groovyJavaLangClass  List Assert ImmutableList

  syn keyword groovyJavaLangObject clone equals finalize getClass hashCode
  syn keyword groovyJavaLangObject notify notifyAll toString wait class

  GroovyHiLink groovyLangClass                   groovyConstant
  GroovyHiLink groovyJavaLangClass               groovyExternal
  GroovyHiLink groovyJavaLangObject              groovyConstant
  syn cluster groovyTop add=groovyJavaLangObject,groovyJavaLangClass,groovyLangClass
  syn cluster groovyClasses add=groovyJavaLangClass,groovyLangClass
"endif


" Groovy stuff
syn match groovyOperator "\.\."
syn match groovyOperator "<\{2,3}"
syn match groovyOperator ">\{2,3}"
syn match groovyOperator "->"
syn match groovyExternal		'^#!.*[/\\]groovy\>'
syn match groovyExceptions        "\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>"

" Groovy JDK stuff
syn keyword groovyJDKBuiltin    as def in
syn keyword groovyJDKOperOverl  div minus plus abs round power multiply
syn keyword groovyJDKMethods 	each call inject sort print println
syn keyword groovyJDKMethods    getAt putAt push pop toList getText writeLine eachLine readLines
syn keyword groovyJDKMethods    withReader withStream withWriter withPrintWriter write read leftShift
syn keyword groovyJDKMethods    withWriterAppend readBytes splitEachLine
syn keyword groovyJDKMethods    newInputStream newOutputStream newPrintWriter newReader newWriter
syn keyword groovyJDKMethods    compareTo next previous isCase
"syn keyword groovyJDKMethods    times step toInteger upto any collect dump every find findAll grep
syn keyword groovyJDKMethods    times step toInteger upto any dump every find findAll grep
syn keyword groovyJDKMethods    inspect invokeMethods join
syn keyword groovyJDKMethods    getErr getIn getOut waitForOrKill
syn keyword groovyJDKMethods    count tokenize asList flatten immutable intersect reverse reverseEach
syn keyword groovyJDKMethods    subMap append asWritable eachByte eachLine eachFile

"syn keyword groovyJDKMethods plus minus multiply div mod equals intersect
"collect count every any
syn keyword groovyJDKMethods ONE ROUND_CEILING ROUND_DOWN ROUND_FLOOR ROUND_HALF_DOWN ROUND_HALF_EVEN ROUND_HALF_UP ROUND_UNNECESSARY ROUND UP TEN ZERO
syn keyword groovyJDKMethods MAX_VALUE MIN_VALUE SIZE TYPE FALSE TRUE CASE_INSENSITIVE_ORDER
syn keyword groovyJDKMethods abs addAll and asType
syn keyword groovyJDKMethods bitCount bitwiseNegate booleanValue byteValue byteValueExact
syn keyword groovyJDKMethods charAt clear codePointAt codePointBefore codePointCount compareTo compareToIgnoreCase collate combinations concat containsAll containsKey containsValue contentEquals copyValueOf count countBy curry
syn keyword groovyJDKMethods decode disjoint divideAndRemainder divideToIntegralValue doubleValue downto drop dropWhile dump
syn keyword groovyJDKMethods each eachPermutation eachWithIndex endsWith ensureCapacity entrySet equalsIgnoreCase 
syn keyword groovyJDKMethods find findAll findIndexOf findIndexValues findResult findResults flatten floatValue format
syn keyword groovyJDKMethods get getAt getBoolean getBytes getChars getInteger grep groupBy groupEntriesBy 
syn keyword groovyJDKMethods head highestOneBit
syn keyword groovyJDKMethods identity indexOf inject inspect intern intValue intValueExact invokeMethod isCase isEmpty iterator 
syn keyword groovyJDKMethods join
syn keyword groovyJDKMethods keySet 
syn keyword groovyJDKMethods lastIndexOf leftShift leftShiftUnsigned length listIterator longValue lowestOneBit
syn keyword groovyJDKMethods matches max min movePointLeft movePointRight
syn keyword groovyJDKMethods negate negative next numberOfLeadingZeros numberOfTrailingZeros
syn keyword groovyJDKMethods offsetByCodePoints or
syn keyword groovyJDKMethods parseBoolean parseInt pop positive pow power precision previous properties put putAll putAt
syn keyword groovyJDKMethods regionMatches remainder remove removeAll replace replaceAll replaceFirst retainAll reverse reverseBytes rightShift rightShiftUnsigned round
syn keyword groovyJDKMethods scale scaleByPowerOfTen set signum sort split spread startsWith StripTrailingZeros subList subMap subsequence substring
syn keyword groovyJDKMethods tail take takeWhile toArray toBigInteger toBigIntegerExact toBinaryString toCharArray toEngineeringString toHexString toList toLowerCase toOctalString toPlainString toSet toString toUpperCase transpose trim trimToSize
syn keyword groovyJDKMethods ulp unaryMinus unaryPlus unique unscaledValue upto
syn keyword groovyJDKMethods valueOf values
syn keyword groovyJDKMethods xor
"syn keyword groovyJDKMethods 
"class.methods.name class.fields.name

syn cluster groovyTop add=groovyJDKBuiltin,groovyJDKOperOverl,groovyJDKMethods

" no useful I think, so I comment it..
"if filereadable(expand("<sfile>:p:h")."/groovyid.vim")
 " source <sfile>:p:h/groovyid.vim
"endif

if exists("groovy_space_errors")
  if !exists("groovy_no_trail_space_error")
    syn match   groovySpaceError  "\s\+$"
  endif
  if !exists("groovy_no_tab_space_error")
    syn match   groovySpaceError  " \+\t"me=e-1
  endif
endif

" it is a better case construct than java.vim to match groovy syntax
syn region  groovyLabelRegion     transparent matchgroup=groovyLabel start="\<case\>" matchgroup=NONE end=":\|$" contains=groovyNumber,groovyString,groovyLangClass,groovyJavaLangClass
syn match   groovyUserLabel       "^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=groovyLabel
syn keyword groovyLabel           default

if !exists("groovy_allow_cpp_keywords")
  syn keyword groovyError auto delete extern friend inline redeclared
  syn keyword groovyError register signed sizeof struct template typedef union
  syn keyword groovyError unsigned operator
endif

" The following cluster contains all groovy groups except the contained ones
syn cluster groovyTop add=groovyExternal,groovyError,groovyError,groovyBranch,groovyLabelRegion,groovyLabel,groovyConditional,groovyRepeat,groovyBoolean,groovyConstant,groovyTypedef,groovyOperator,groovyType,groovyType,groovyStatement,groovyStorageClass,groovyAssert,groovyExceptions,groovyMethodDecl,groovyClassDecl,groovyClassDecl,groovyClassDecl,groovyScopeDecl,groovyError,groovyError2,groovyUserLabel,groovyLangObject


" Comments
syn keyword groovyTodo             contained TODO FIXME XXX
if exists("groovy_comment_strings")
  syn region  groovyCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=groovySpecial,groovyCommentStar,groovySpecialChar,@Spell
  syn region  groovyComment2String   contained start=+"+  end=+$\|"+  contains=groovySpecial,groovySpecialChar,@Spell
  syn match   groovyCommentCharacter contained "'\\[^']\{1,6\}'" contains=groovySpecialChar
  syn match   groovyCommentCharacter contained "'\\''" contains=groovySpecialChar
  syn match   groovyCommentCharacter contained "'[^\\]'"
  syn cluster groovyCommentSpecial add=groovyCommentString,groovyCommentCharacter,groovyNumber
  syn cluster groovyCommentSpecial2 add=groovyComment2String,groovyCommentCharacter,groovyNumber
endif
syn region  groovyComment          start="/\*"  end="\*/" contains=@groovyCommentSpecial,groovyTodo,@Spell
syn match   groovyCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   groovyCommentStar      contained "^\s*\*$"
syn match   groovyLineComment      "//.*" contains=@groovyCommentSpecial2,groovyTodo,@Spell
syn match   groovyLineComment      "#.*" contains=@groovyCommentSpecial2,groovyTodo,@Spell
GroovyHiLink groovyCommentString groovyString
GroovyHiLink groovyComment2String groovyString
GroovyHiLink groovyCommentCharacter groovyCharacter

syn cluster groovyTop add=groovyComment,groovyLineComment

" !!!!!! 
" if !exists("groovy_ignore_groovydoc") && main_syntax != 'jsp'
"   syntax case ignore
"   " syntax coloring for groovydoc comments (HTML)
"   " syntax include @groovyHtml <sfile>:p:h/html.vim
"    syntax include @groovyHtml runtime! syntax/html.vim
"   unlet b:current_syntax
"   syntax spell default  " added by Bram
"   syn region  groovyDocComment    start="/\*\*"  end="\*/" keepend contains=groovyCommentTitle,@groovyHtml,groovyDocTags,groovyTodo,@Spell
"   syn region  groovyCommentTitle  contained matchgroup=groovyDocComment start="/\*\*"   matchgroup=groovyCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@groovyHtml,groovyCommentStar,groovyTodo,@Spell,groovyDocTags

"   syn region groovyDocTags  contained start="{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
"   syn match  groovyDocTags  contained "@\(see\|param\|exception\|throws\|since\)\s\+\S\+" contains=groovyDocParam
"   syn match  groovyDocParam contained "\s\S\+"
"   syn match  groovyDocTags  contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
"   syntax case match
" endif

" " match the special comment /**/
" syn match   groovyComment          "/\*\*/"
" !!!!!

" Strings and constants
syn match   groovySpecialError     contained "\\."
syn match   groovySpecialCharError contained "[^']"
syn match   groovySpecialChar      contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\|\$\)"
syn match   groovyRegexChar        contained "\\."
syn region  groovyString          start=+"+ end=+"+ end=+$+ contains=groovySpecialChar,groovySpecialError,@Spell,groovyELExpr
syn region  groovyString          start=+'+ end=+'+ end=+$+ contains=groovySpecialChar,groovySpecialError,@Spell
syn region  groovyString          start=+"""+ end=+"""+ contains=groovySpecialChar,groovySpecialError,@Spell,groovyELExpr
syn region  groovyString          start=+'''+ end=+'''+ contains=groovySpecialChar,groovySpecialError,@Spell
" regex string
" syn region groovyString           start='/[^/]'  end='/' contains=groovySpecialChar,groovyRegexChar,groovyELExpr
" syn region groovyELExpr start=+${+ end=+}+ keepend contained
syn match groovyELExpr /\${.\{-}}/ contained
syn match groovyELExpr /\$[a-zA-Z_][a-zA-Z0-9_.]*/ contained
GroovyHiLink groovyELExpr Identifier

" TODO: better matching. I am waiting to understand how it really works in groovy
" syn region  groovyClosureParamsBraces          start=+|+ end=+|+ contains=groovyClosureParams
" syn match groovyClosureParams	"[ a-zA-Z0-9_*]\+" contained
" GroovyHiLink groovyClosureParams Identifier

" next line disabled, it can cause a crash for a long line
"syn match   groovyStringError      +"\([^"\\]\|\\.\)*$+

" disabled: in groovy strings or characters are written the same
" syn match   groovyCharacter        "'[^']*'" contains=groovySpecialChar,groovySpecialCharError
" syn match   groovyCharacter        "'\\''" contains=groovySpecialChar
" syn match   groovyCharacter        "'[^\\]'"
syn match   groovyNumber           "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   groovyNumber           "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   groovyNumber           "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   groovyNumber           "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

" unicode characters
syn match   groovySpecial "\\u\d\{4\}"

syn cluster groovyTop add=groovyString,groovyCharacter,groovyNumber,groovySpecial,groovyStringError

" if exists("groovy_highlight_functions")
"   if groovy_highlight_functions == "indent"
"     syn match  groovyFuncDef "^\(\t\| \{8\}\)[_$a-zA-Z][_$a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=groovyScopeDecl,groovyType,groovyStorageClass,@groovyClasses
"     syn region groovyFuncDef start=+^\(\t\| \{8\}\)[$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=groovyScopeDecl,groovyType,groovyStorageClass,@groovyClasses
"     syn match  groovyFuncDef "^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=groovyScopeDecl,groovyType,groovyStorageClass,@groovyClasses
"     syn region groovyFuncDef start=+^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=groovyScopeDecl,groovyType,groovyStorageClass,@groovyClasses
"   else
"     " This line catches method declarations at any indentation>0, but it assumes
"     " two things:
"     "   1. class names are always capitalized (ie: Button)
"     "   2. method names are never capitalized (except constructors, of course)
"     syn region groovyFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*([^0-9]+ end=+)+ contains=groovyScopeDecl,groovyType,groovyStorageClass,groovyComment,groovyLineComment,@groovyClasses
"   endif
"   syn match  groovyBraces  "[{}]"
"   syn cluster groovyTop add=groovyFuncDef,groovyBraces
" endif

"if exists("groovy_highlight_debug")

  " " Strings and constants
  " syn match   groovyDebugSpecial          contained "\\\d\d\d\|\\."
  " syn region  groovyDebugString           contained start=+"+  end=+"+  contains=groovyDebugSpecial
  " syn match   groovyDebugStringError      +"\([^"\\]\|\\.\)*$+
  " syn match   groovyDebugCharacter        contained "'[^\\]'"
  " syn match   groovyDebugSpecialCharacter contained "'\\.'"
  " syn match   groovyDebugSpecialCharacter contained "'\\''"
  " syn match   groovyDebugNumber           contained "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
  " syn match   groovyDebugNumber           contained "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
  " syn match   groovyDebugNumber           contained "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
  " syn match   groovyDebugNumber           contained "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
  " syn keyword groovyDebugBoolean          contained true false
  " syn keyword groovyDebugType             contained null this super
  " syn region groovyDebugParen  start=+(+ end=+)+ contained contains=groovyDebug.*,groovyDebugParen

  " " to make this work you must define the highlighting for these groups
  " syn match groovyDebug "\<System\.\(out\|err\)\.print\(ln\)*\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen
  " syn match groovyDebug "\<p\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen
  " syn match groovyDebug "[A-Za-z][a-zA-Z0-9_]*\.printStackTrace\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen
  " syn match groovyDebug "\<trace[SL]\=\s*("me=e-1 contains=groovyDebug.* nextgroup=groovyDebugParen

  " syn cluster groovyTop add=groovyDebug

  " if version >= 508 || !exists("did_c_syn_inits")
  "   GroovyHiLink groovyDebug                 Debug
  "   GroovyHiLink groovyDebugString           DebugString
  "   GroovyHiLink groovyDebugStringError      groovyError
  "   GroovyHiLink groovyDebugType             DebugType
  "   GroovyHiLink groovyDebugBoolean          DebugBoolean
  "   GroovyHiLink groovyDebugNumber           Debug
  "   GroovyHiLink groovyDebugSpecial          DebugSpecial
  "   GroovyHiLink groovyDebugSpecialCharacter DebugSpecial
  "   GroovyHiLink groovyDebugCharacter        DebugString
  "   GroovyHiLink groovyDebugParen            Debug

  "   GroovyHiLink DebugString               String
  "   GroovyHiLink DebugSpecial              Special
  "   GroovyHiLink DebugBoolean              Boolean
  "   GroovyHiLink DebugType                 Type
  " endif
"endif

syn match groovyAnnotation  "@[_A-Za-z][_A-Za-z0-9]*"

" Match all Exception classes
syn match groovyExceptions        "\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>"


if !exists("groovy_minlines")
  let groovy_minlines = 1000
endif
exec "syn sync ccomment groovyComment minlines=" . groovy_minlines


" ###################
" Groovy stuff
" syn match groovyOperator		"|[ ,a-zA-Z0-9_*]\+|"

" All groovy valid tokens
" syn match groovyTokens ";\|,\|<=>\|<>\|:\|:=\|>\|>=\|=\|==\|<\|<=\|!=\|/\|/=\|\.\.|\.\.\.\|\~=\|\~=="
" syn match groovyTokens "\*=\|&\|&=\|\*\|->\|\~\|+\|-\|/\|?\|<<<\|>>>\|<<\|>>"

" Must put explicit these ones because groovy.vim mark them as errors otherwise
" syn match groovyTokens "<=>\|<>\|==\~"
"syn cluster groovyTop add=groovyTokens

" Mark these as operators

" Hightlight brackets
" syn match  groovyBraces		"[{}]"
" syn match  groovyBraces		"[\[\]]"
" syn match  groovyBraces		"[\|]"

" if exists("groovy_mark_braces_in_parens_as_errors")
"   syn match groovyInParen          contained "[{}]"
"   GroovyHiLink groovyInParen        groovyError
"   syn cluster groovyTop add=groovyInParen
" endif

" " catch errors caused by wrong parenthesis
" syn region  groovyParenT  transparent matchgroup=groovyParen  start="("  end=")" contains=@groovyTop,groovyParenT1
" syn region  groovyParenT1 transparent matchgroup=groovyParen1 start="(" end=")" contains=@groovyTop,groovyParenT2 contained
" syn region  groovyParenT2 transparent matchgroup=groovyParen2 start="(" end=")" contains=@groovyTop,groovyParenT  contained
" syn match   groovyParenError       ")"
" GroovyHiLink groovyParenError       groovyError

" " catch errors caused by wrong square parenthesis
" syn region  groovyParenT  transparent matchgroup=groovyParen  start="\["  end="\]" contains=@groovyTop,groovyParenT1
" syn region  groovyParenT1 transparent matchgroup=groovyParen1 start="\[" end="\]" contains=@groovyTop,groovyParenT2 contained
" syn region  groovyParenT2 transparent matchgroup=groovyParen2 start="\[" end="\]" contains=@groovyTop,groovyParenT  contained
" syn match   groovyParenError       "\]"

" ###############################
" java.vim default highlighting
if version >= 508 || !exists("did_groovy_syn_inits")
  if version < 508
    let did_groovy_syn_inits = 1
  endif
  GroovyHiLink groovyFuncDef		Function
  GroovyHiLink groovyBraces		Function
  GroovyHiLink groovyBranch		Conditional
  GroovyHiLink groovyUserLabelRef	groovyUserLabel
  GroovyHiLink groovyLabel		Label
  GroovyHiLink groovyUserLabel		Label
  GroovyHiLink groovyConditional	Conditional
  GroovyHiLink groovyRepeat		Repeat
  GroovyHiLink groovyExceptions		Exception
  GroovyHiLink groovyAssert 		Statement
  GroovyHiLink groovyStorageClass	StorageClass
  GroovyHiLink groovyMethodDecl		groovyStorageClass
  GroovyHiLink groovyClassDecl		groovyStorageClass
  GroovyHiLink groovyScopeDecl		groovyStorageClass
  GroovyHiLink groovyBoolean		Boolean
  GroovyHiLink groovySpecial		Special
  GroovyHiLink groovySpecialError	Error
  GroovyHiLink groovySpecialCharError	Error
  GroovyHiLink groovyString		String
  GroovyHiLink groovyRegexChar		String
  GroovyHiLink groovyCharacter		Character
  GroovyHiLink groovySpecialChar	SpecialChar
  GroovyHiLink groovyNumber		Number
  GroovyHiLink groovyError		Error
  GroovyHiLink groovyStringError	Error
  GroovyHiLink groovyStatement		Statement
  GroovyHiLink groovyOperator		Operator
  GroovyHiLink groovyComment		Comment
  GroovyHiLink groovyDocComment		Comment
  GroovyHiLink groovyLineComment	Comment
  GroovyHiLink groovyConstant		Constant
  GroovyHiLink groovyTypedef		Typedef
  GroovyHiLink groovyTodo		Todo

  GroovyHiLink groovyCommentTitle	SpecialComment
  GroovyHiLink groovyDocTags		Special
  GroovyHiLink groovyDocParam		Function
  GroovyHiLink groovyCommentStar	groovyComment

  GroovyHiLink groovyType		Type
  GroovyHiLink groovyExternal		Include

  GroovyHiLink htmlComment		Special
  GroovyHiLink htmlCommentPart		Special
  GroovyHiLink groovySpaceError		Error
  GroovyHiLink groovyJDKBuiltin         Special
  GroovyHiLink groovyJDKOperOverl       Operator
  GroovyHiLink groovyJDKMethods         Function
  GroovyHiLink groovyAnnotation         Function
endif

delcommand GroovyHiLink


let b:current_syntax = "groovy"
if main_syntax == 'groovy'
  unlet main_syntax
endif

let b:spell_options="contained"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
