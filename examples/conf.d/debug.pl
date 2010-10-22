:- module(conf_debug, [ tmon/0 ]).
:- use_module(library(debug)).

/** <module> Set options for development

This  module  make  ClioPatria  more    suitable   for  development.  In
particular, it implements the following methods:

    * Load library(http/http_error), which causes uncaught Prolog
    exceptions to produce an HTML page holding a stack-trace.
    * Load library(semweb/rdf_portray), which prints RDF resources
    in a more compact way.
    * Load library(semweb/rdf_db) into the module =user=.  This allows
    usage of rdf/3, rdf_load/1, etc. from the toplevel without
    specifying the module.
    * Use debug/1 on the _topic_ http(request), which causes the
    toplevel to print basic information on the HTTP requests processed.
    Using copy/paste of the HTTP path, one can assemble a command that
    edits the implementation of a page.

        ==
        ?- edit('/http/path/to/handler').
        ==
    * Define tmon/0 that brings up a graphical tool showing thread
    activity.

@see	http://www.swi-prolog.org/howto/http/Developing.html
*/

:- use_module(library(http/http_error)).
:- use_module(library(semweb/rdf_portray)).
:- use_module(user:library(semweb/rdf_db)).

:- debug(http(request)).

%%	tmon
%
%	Show the graphical thread-monitor. Can be  useful to examine and
%	debug active goals.

tmon :-
	call(prolog_ide(thread_monitor)).
