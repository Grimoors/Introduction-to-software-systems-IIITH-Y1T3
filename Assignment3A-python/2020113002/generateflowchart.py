from pyflowchart import Flowchart
with open('lookup2.py') as f:
	code = f.read()
fc = Flowchart.from_code(code, field='', inner=False)
with open('flowchart-js-code.txt','wt') as f:
    f.write(fc.flowchart())