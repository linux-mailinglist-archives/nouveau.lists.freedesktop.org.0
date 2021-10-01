Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E341F5D3
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 21:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98F36F3AA;
	Fri,  1 Oct 2021 19:40:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC536F3A9
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 19:40:25 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id i13so11702594ilm.4
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 12:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vpNbX8hSQDJCgq6vSjQkUiRlQxw1KMDfIAJ3Lw/2NIY=;
 b=PAxcA/B1JYowZj1aZ5ubqmIBdJfG44xyL8mU42vP8fB1Wehppck2KnwVFCxbboCi97
 +PlzF7MTgNZIlY6EbfZbg2Vo/3E9bMENap7w7SmFACD+iZtpKPN5cMtshSFJ0D+DLehm
 Yr3zH13rCOjGmENp1i3UXfJTg7meFfaBedvE1Ine+EuYBl/I2Jzy+cV2yXNOGuDtr4kJ
 cW2wGKT44HYWsBh+oxv3JqEvLYOQDeiFgAi5YsGVT42LSZ1JkWOtZbx88K+wlfBYfVWu
 QRwCe0Jq5tNkFpbmTRGkM5hfCdE5cSzPRt61EsFNd6R1H3dWZfsV96IFNir/uenigwVZ
 8Btg==
X-Gm-Message-State: AOAM532HmIhwGI62lDFzbEoRpMCujv3NgEo47PkrbHESbE7vzVJtHe5p
 nhpP3U7nFTH5OFU9O8OVAoIii+GdPG3+l9AJL3U=
X-Google-Smtp-Source: ABdhPJx684cWhpqDi4wqxZHEHPuYT5MOKaGJZb9xnVZtqvWsdzWcXaDi5fmMoZdOhqnEfv8aP6CcGKMDNUEtsbyBfyU=
X-Received: by 2002:a05:6e02:1a8d:: with SMTP id
 k13mr9692783ilv.70.1633117224989; 
 Fri, 01 Oct 2021 12:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
 <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
 <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
 <CABr8-B5cakVP_VLHFv4ORxZynddEskrHjbhXGAsVbFRsBkDuVg@mail.gmail.com>
 <CABr8-B6BfU--4WOXP3z80MpkN6rFsUpMTYN_y7yatYSA6RGvzw@mail.gmail.com>
In-Reply-To: <CABr8-B6BfU--4WOXP3z80MpkN6rFsUpMTYN_y7yatYSA6RGvzw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 Oct 2021 15:40:13 -0400
Message-ID: <CAKb7UvgaOi9Le9F2hv3d2xjSrxenatUWMobKjjfb_UfGuPRbtA@mail.gmail.com>
To: Jerry Geis <jerry.geis@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Oct 1, 2021 at 3:36 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>
>
>
> On Fri, Oct 1, 2021 at 3:27 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>>
>>
>>
>> On Fri, Oct 1, 2021 at 3:20 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>
>>> On Fri, Oct 1, 2021 at 3:17 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>>> > On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>> >>
>>> >> On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>>> >> > lsmod | grep nouveau
>>> >> >
>>> >> > What dont I have ?
>>> >>
>>> >> nouveau :)
>>> >>
>>> >> Other than that, you got everything...
>>> >>
>>> >> Check dmesg for errors.
>>> >>
>>> >> Cheers,
>>> >>
>>> >>   -ilia
>>> >
>>> >
>>> > I see this:
>>> > Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==) Matched nouveau as autoconfigured driver 0
>>>
>>> This is not dmesg. This is some log file. Please look in dmesg.
>>>
>>> > Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (**) VESA(0): Using "Shadow Framebuffer"
>>>
>>> X is using the VESA driver because nouveau (nor any other DRM driver) is loaded.
>>>
>>> >
>>> > So it seems like its loading .... but perhaps its not happy ????
>>> >
>>> > What do I do  ?
>>>
>>> Check dmesg for why nouveau didn't load.
>>>
>>>   -ilia
>>
>>
>>  grep -i nouveau /var/log/dmesg
>> [   19.934733] kernel: fb0: switching to nouveaufb from VESA VGA
>> [   20.013197] kernel: nouveau 0000:03:00.0: vgaarb: deactivate vga console
>> [   20.013415] kernel: nouveau 0000:03:00.0: NVIDIA GT218 (0a8200b1)
>> [   20.159472] kernel: nouveau 0000:03:00.0: bios: version 70.18.45.00.00
>> [   20.162603] kernel: nouveau 0000:03:00.0: fb: 512 MiB DDR3
>> [   21.552858] kernel: nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
>> [   21.552873] kernel: nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
>> [   21.552888] kernel: nouveau 0000:03:00.0: DRM: TMDS table version 2.0
>> [   21.552900] kernel: nouveau 0000:03:00.0: DRM: DCB version 4.0
>> [   21.552911] kernel: nouveau 0000:03:00.0: DRM: DCB outp 00: 01000302 00000030
>> [   21.552924] kernel: nouveau 0000:03:00.0: DRM: DCB outp 01: 02000300 00000000
>> [   21.552937] kernel: nouveau 0000:03:00.0: DRM: DCB outp 02: 02011362 00020010
>> [   21.552950] kernel: nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
>> [   21.552961] kernel: nouveau 0000:03:00.0: DRM: DCB conn 01: 00002161
>> [   21.568834] kernel: nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
>> [   21.645206] kernel: nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb: 0x70000, bo (____ptrval____)
>> [   21.648681] kernel: fbcon: nouveaudrmfb (fb0) is primary device
>> [   21.837701] kernel: nouveau 0000:03:00.0: [drm] fb0: nouveaudrmfb frame buffer device
>> [   21.873290] kernel: [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 0

I was looking for you to just run "dmesg", BTW, not read a log file.

>>
>> lsmod | grep nouveau
>> nouveau              1986560  30
>> mxm_wmi                16384  1 nouveau
>> i2c_algo_bit           16384  1 nouveau
>> drm_ttm_helper         16384  1 nouveau
>> ttm                    73728  2 drm_ttm_helper,nouveau
>> drm_kms_helper        237568  1 nouveau
>> drm                   548864  25 drm_kms_helper,drm_ttm_helper,ttm,nouveau
>> video                  53248  1 nouveau
>> wmi                    32768  2 mxm_wmi,nouveau
>>
>> I took off ALL extra kernel command paramters - nothing specific to nouveau - and I got better results. however - video is still dropping frames.

Perhaps you had a "nomodeset" in there? That would prevent nouveau
from doing anything useful, although I think it'd still load in that
case.

>>
>> So progress. but still no good.

Check xorg log to make sure you see NOUVEAU lines, not modeset lines.
If you see modeset lines, make sure you force the nouveau DDX driver
to load. (Some distros think it's funny to prevent it from loading by
default...)

>>
>> Jerry
>
>
> I see this error:
> nouveau 0000:03:00.0: Direct firmware load for nouveau/nva8_fuc084 failed
>
> I did apt-file search nva8_fuc084
> and it did not return anything.

This is for video decoding acceleration (vdpau / va-api). You can set
this up by following the instructions at
https://nouveau.freedesktop.org/VideoAcceleration.html . Note that
it's hardly perfect.

Cheers,

  -ilia
