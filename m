Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32F5BEF1D
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 23:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37AE10E7AA;
	Tue, 20 Sep 2022 21:24:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Wed, 07 Sep 2022 10:42:37 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B8210E546;
 Wed,  7 Sep 2022 10:42:36 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.23]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MBlgy-1odXvW2p1o-00CEBe; Wed, 07 Sep 2022 12:36:06 +0200
Message-ID: <965de5c0-bc6a-7210-c946-b916ae2219fc@i2se.com>
Date: Wed, 7 Sep 2022 12:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
 <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
 <20220905145729.ln675jko3aw6sgzs@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220905145729.ln675jko3aw6sgzs@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:raTGFr7ptnGZr2h9Jh6nKg1Z14xx0x8riNatR19Mgp3HoRXLPdX
 FN+/gOxN9VXjXLIhXVkBpgujUpNMYSy+G4CQp211BQEbL4066eK8AZ57x7+Ryp53nqef83R
 XG19WvSzjiVdclyB4a503Xj8phHhNIsA5aMzvA3iiMzzCLqNQD5cu7Y+WiuUERVXn8PvvlY
 lI8tCye4pEPGe1CN/8vMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4njlfsGRC8s=:ocGf4vtKJR1Zun/4Yo9Gew
 oV3WA6jbTihJu4RIdmFFuTHK3kktStgU7S9zvefX/Uhazuyps7stnTU2x3JqvoEXjhTdnVbHU
 qwY1Q/WMxCFL6JR4wLPfSTPCGsmlEYphfk1SiH/Bcir2uS5YOQKO/mFmA8KX3O2nMy8am3g0E
 KIwNisfJurVnvt/yAavIe3GeFCV60loPn0+iIKFNQjZ7SOqEXMuVhM6FELQr9qKGkKdEDa7Q1
 A9wg9nmhVj/EtYbfJ2PNuClR30bKQg+3V2rYG/j/cGyi1p//mBN8Sy1DhZncYRcGdhhnz7Niq
 45qpsR6TOWOvz33/DJj/XtmOkMpXfWVjvBlCmSJygsmgSTz1fYJHLSBywB9Rin+rQtWHtoWj7
 dJrU2wGnRqUzI9sLWTzRv2aKqAjgfJ2VGh6nRfI/KQM/bm6OwI9Kxw4Sysfjrg4Vzxbj+jaZW
 X2yCy+xVoP8s5IvGrcmxqykNKk0QWUEy8GlDbk7akxSA2x8g9uz5XnFt6vKG2hW2MnxJ+3uF6
 mFMuBh8idCuY4qTO0jbDtmJoZePoAwwD22L8dkdLaLuzds0uVnC9Xs8GhL8i4WFPKuv/9NQdW
 VwRMyYQchqhbhhAZGPZFIEiQCxgMeb9Nv2+z6VDPT/DYjgBEuqnaDrsW/Tp2VJJWKpPuDDBUK
 MELDZt551/OYOXwNUWK67qlinaEMnaW3TLzS4TlmnDUwn6wUAg8uBC2OIN5uDdBNTeZDhRR6z
 SiMdl7zgJeN/5xOO4iQk/QT9URtagyTBr5s1KpbHjqpuemPNZnzFUfgbVuPiv5ZBJhOIsAIJg
 93udFi74Vi+UTGrEiD2nBU95bTZhg==
X-Mailman-Approved-At: Tue, 20 Sep 2022 21:24:03 +0000
Subject: Re: [Nouveau] [PATCH v2 00/41] drm: Analog TV Improvements
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Maxime,

Am 05.09.22 um 16:57 schrieb Maxime Ripard:
> On Fri, Sep 02, 2022 at 01:28:16PM +0200, Noralf Trønnes wrote:
>>
>> Den 01.09.2022 21.35, skrev Noralf Trønnes:
>>>
>>> I have finally found a workaround for my kernel hangs.
>>>
>>> Dom had a look at my kernel and found that the VideoCore was fine, and
>>> he said this:
>>>
>>>> That suggests cause of lockup was on arm side rather than VC side.
>>>>
>>>> But it's hard to diagnose further. Once you've had a peripheral not
>>>> respond, the AXI bus locks up and no further operations are possible.
>>>> Usual causes of this are required clocks being stopped or domains
>>>> disabled and then trying to access the hardware.
>>>>
>>> So when I got this on my 64-bit build:
>>>
>>> [  166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 -- SError
>>> [  166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G        W
>>>      5.19.0-rc6-00096-gba7973977976-dirty #1
>>> [  166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
>>> [  166.702206] Workqueue: events_freezable_power_ thermal_zone_device_check
>>> [  166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS
>>> BTYPE=--)
>>> [  166.702242] pc : regmap_mmio_read32le+0x10/0x28
>>> [  166.702261] lr : regmap_mmio_read+0x44/0x70
>>> ...
>>> [  166.702606]  bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]
>>>
>>> I wondered if that reg read was stalled due to a clock being stopped.
>>>
>>> Lo and behold, disabling runtime pm and keeping the vec clock running
>>> all the time fixed it[1].
>>>
>>> I don't know what the problem is, but at least I can now test this patchset.
>>>
>>> [1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065
>>>
>> It turns out I didn't have to disable runtime pm:
>> https://gist.github.com/notro/0adcfcb12460b54e54458afe11dc8ea2
> If the bcm2711_thermal IP needs that clock to be enabled, it should grab
> a reference itself, but it looks like even the device tree binding
> doesn't ask for one.
The missing clock in the device tree binding is expected, because 
despite of the code there is not much information about the BCM2711 
clock tree. But i'm skeptical that the AVS IP actually needs the VEC 
clock, i think it's more likely that the VEC clock parent is changed and 
that cause this issue. I could take care of the bcm2711 binding & driver 
if i know which clock is really necessary.
>
> Maxime
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
