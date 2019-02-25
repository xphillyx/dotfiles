import subprocess
import terminatorlib.plugin as plugin
from terminatorlib.config import Config

available = ['DannysSublimeUrlHandler']
AVAILABLE = available

class DannysSublimeUrlHandler(plugin.MenuItem):
  capabilities = ['url_handler']
  handler_name = 'dannys_sublime_url_handler'
  match = r'/.+\:[0-9]+\:[0-9]+'

  def callback(self, url):
    subprocess.call(['subl3', '--add', url])
