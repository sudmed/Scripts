REM cd /d C:\Python39
call python -m ensurepip --upgrade
call python -m pip install --upgrade pip
TIMEOUT /T 5
REM Installing packets
call pip install wheel
call pip install pipenv
call pip install numpy scipy matplotlib ipython sympy pandas certifi chardet idna requests six urllib3 vk vk_api attrs backcall bleach colorama cycler decorator defusedxml Django entrypoints ipykernel ipython-genutils ipywidgets jedi Jinja2 joblib jsonschema jupyter jupyter-client jupyter-console jupyter-core kiwisolver lxml MarkupSafe mistune mpmath music nbconvert nbformat notebook pandocfilters parso pickleshare Pillow prometheus-client prompt-toolkit Pygments pyparsing pyrsistent python-dateutil python-docx pytz pywin32 pywinpty pyzmq qtconsole scikit-learn seaborn Send2Trash sklearn termcolor terminado testpath tornado traitlets wcwidth webencodings widgetsnbextension wing click DAWG-Python docopt pymorphy2 pymorphy2-dicts python-dotenv
REM call python -m pip install numpy scipy matplotlib ipython sympy pandas
call pip install pyqt5 PyQt5-tools PyQt5-sip
python -m pip list
TIMEOUT /T 20
PAUSE
exit
