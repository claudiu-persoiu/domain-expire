# Domain certificate expiration checker

As https://letsencrypt.org/ is dropping notifications for domain expiration notifications, I decided to build a small tool to achieve a similar functionality.

## Usage

    $ go build -o domain
    $ ./domain google.com

The return value is in days, for convenience, to be easily integrated into automations.

## Home assistant usage example

1. Make sure to compile the app for the right platform
2. Copy the ``domain`` executable to the ``/config`` folder of Home Assistant
3. Edit your ``configuration.yaml`` file and add:
```
command_line:
   - sensor:
         unique_id: days_google_com
         name: Days Google.com
         command: "/config/domain google.com"
         unit_of_measurement: "days"
         scan_interval: 43200
```
(Note: you may need to adjust the command path depending on your config path)
4. (Optional) Trigger an alert on your phone from HA companion app, in your ``/config/automations`` folder create a file called ``domain.yaml`` and paste the code below:
```
- id: domain_alert
  alias: Domain Google.com
  trigger:
  - trigger: time
    at: "09:30:00"
  conditions: "{{ states('sensor.days_google_com') | float < 10 }}"
  action:
  - data:
      title: 'Update the certificate!'
      message: 'Remember to update the certificate for Google.com!'
      data:
        sticky: 'true'
        clickAction: "/lovelace/default_view"
    service: notify.ALL_DEVICES
```
5. Enjoy your new sensors and alerts!


DISCLAIMER

IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.