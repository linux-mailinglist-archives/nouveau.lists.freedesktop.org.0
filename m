Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9E244D2CF
	for <lists+nouveau@lfdr.de>; Thu, 11 Nov 2021 08:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483706EA63;
	Thu, 11 Nov 2021 07:59:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1D86EA63
 for <nouveau@lists.freedesktop.org>; Thu, 11 Nov 2021 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636617557;
 bh=wDCbSXKW5heZxc3X80AxXt0zzeQtTR6l9xwaeyK2Fqg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UKzW5SUiriUx+6EMH9xC6HM4lXgkt7ceuwuOFf5OLDg9Iz6T2pH9I2iiIH+rMmm9n
 sfWGfmynPFEn4Q9L+xU21kDNMVuloA/tltczpcvGbMgbNYt27fyqx1RP7pxt/VA/o+
 A7hb2FFpVHx4/TtrLMRRtAYn3RsOnOxFgRo2s75I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.181] ([178.115.40.235]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGW7-1n3zMW33Yj-00Pby2; Thu, 11
 Nov 2021 08:54:06 +0100
Message-ID: <3301ae21-6427-b706-e544-67ec82109271@gmx.net>
Date: Thu, 11 Nov 2021 08:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Karol Herbst <kherbst@redhat.com>
References: <4a8b1573-3cd6-19cc-b18b-588d7d8283d9@gmx.net>
 <CACO55tun0ohXCNV_3o3eZozs7+ehy-Bv0_cxP+uaOMFgwkq_Nw@mail.gmail.com>
From: Linux User #330250 <linuxuser330250@gmx.net>
In-Reply-To: <CACO55tun0ohXCNV_3o3eZozs7+ehy-Bv0_cxP+uaOMFgwkq_Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Rq2T+UNAAOf9yeh02Ely7TegzjhAG5ZXDC3j4Nrr2Jqe2udJhQ7
 CvuizfK9COTKhhzGac99mIoHz6hXJZznSc1HpfFzwKiIr4VZAd+lImgaaoJeFcA1MaW6Wa5
 V+VCN+jwkb9kBqkNQQ9CuE28wmFPu+6tK3vLRJ/gHrXzBBW5LGPbBiRSoN/xJs3aDAhH9Io
 rG/Q6I6vkeMHjVf0Oh5eQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E07DMnN99eE=:1V/OjK+MBCYCw5Qq//gVeD
 4LwSZAl/UDZX7wkcT8uf54M0wR6fXf2kjpwixrAPoLF1PB3NMcShOrykNLztE3MJBgxmnDkLX
 q3GwrCkVR7QNp9/ecwwCzYKrTLceIbYL+toOiPoDZf9k0MrbPrd4r3r2jnhHnLy7r8KC62Mil
 u4Uz0Xu/unU0nDPhL+K0OTDxmpUDovolbhPnzFwwreh9P6ZEMNw9g8LEIUiGxgk4yL3YLD5KB
 y/ch5UnSRuiG2Yh7rBoCHv/5cCaGN6JpIq21KeJJ1Ov9JWC74k9EEYOIiq0CO4krZrc8I4mQp
 QvO+NVlmyMiuNBn5uPMeDqXAdl2QGzGPP4W8J4hMs6UXyn834849RAJsP827sHXIrk7YUd4x5
 ohYGJaOeODrK7iP23iXE5ytPjijIvCPwk1FVnTYq35z/pxjOHlUJWr2nHQ3aYLZhBnVwZcQyB
 dsWPyifOVJBkd8n63Mr7HccFy1efPWvG+qHupep4BdFLBDabHrVH0nJt9kujBkpInVF1n2bkF
 wNOmjXCPdq5CAQT7OoxEze2uNlwP2g3HtBEcm0xsjkQmx5QJ1Mb4VBfD0Ne8lqyoS6PYzF+Of
 UjQ+tlBDmfAo18wm9dtoQLFKJY0gf34roiTc72HEsurWGKHWxtCOy2eVBTNXT2IJo8qKXdENh
 +Uzgi56Z/RdydfLE4cM957aCpDiXfqbEO075x//BcUAoOoYy0C6QB0GcHsP394v98K6eqRcLA
 kK/loSyL5jgxWwlzeDvZbMLOye4ItBKrzr7P27U02W/uDEHwe2hDZv/vFdbpjI+SyHzF+Abqm
 szBAVr0MqnatqSaTpcyaVVGL+arm2Hm82JbLsEfjRr0XQfC28i7nezrF/FN7rQ/J4E6P/wvly
 dvplcaXS/i/XfwniQKOeZ78QWxJ/tjxCsMx280budTPwzgA5peMmxbGy25ro758/uTB0fbucT
 R5KAo9NKU9kciZer723wHzdZ+FXZ2p7irfk+HALtXjFlGSZ0nHIpgzw7dEHDyo0/FtrnJvR4E
 BJ5m0K358zOeHEt/0ODSaJBaIxv1QR2dE+SrvSFYjX+vdFoo75gm1HmyJNgnScH6LJ6K6v3c3
 E8ndFzZizB1tSE=
Subject: Re: [Nouveau] hardware donation
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 02 Nov 2021, 02:24, Karol Herbst wrote:
> On Tue, Oct 26, 2021 at 9:56 PM Linux User #330250
> <linuxuser330250@gmx.net> wrote:
>>
>> Hello!
>>
>> I have a ThinkPad T61 with an Nvidia Quadro G86M [NVS 140M] graphics
>> card. Recently the nvidia binary driver, version 340.x, has been remove=
d
>> from most Linux distributions, forcing the use of nouveau.
>>
>> In the past, when nouveau was unstable/unusable, people moved to the
>> binary driver. Since this in no longer an option, nouveau is now the
>> only option. And I'm totally okay with it, I would have prferred an ope=
n
>> source solution anyway... BUT.
>>
>> BUT nouveau is unstable. I experience random freezes, like others too:
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D995866
>>
>> The only option was to use nomodeset and to have an unaccelerated
>> graphics output. But if you want to use the laptop as a desktop machine=
,
>> this is not much fun.
>>
>> Long story short, the question I have:
>>
>> According to https://nouveau.freedesktop.org/HardwareDonations.html suc=
h
>> a graphics card could be of use?
>>
>
> If you are willing to give away the system anyway, it might make sense
> to retest with recent software, like newest Fedora or debian sid. We
> usually fix bugs, but often fixes are not added downstream. And I
> think the issue shown in this bug is actually fixed already as I
> remember seeing something like this and we fixed it.
>
> If the issue is still there with a recent kernel (newest 5.14 or even
> 5.15) we can look into it.
>
> Thanks

Hi!
Sorry for the late reply. I don't have the time at the moment, but I
will try the newest Debian testing on that system and report back. If
that does work, it is an option to actually keep the system and use it
as originally intended.

If it doesn't work, I'm thinking about 1) Fedora and 2) Gentoo (because
that's what I normally use). Even though the later would be quite time
consuming, I'd certainly get the newest available sources to the hardware.

>> Thanks,
>> Linux User #330250
