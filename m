Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF86F6BB9
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD2A10E49B;
	Thu,  4 May 2023 12:32:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D015D10E66E;
 Mon, 20 Feb 2023 10:51:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s26so2901295edw.11;
 Mon, 20 Feb 2023 02:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1zcGRTl/9l2GpF8LYO2/lWbNZQDU6Xe0XQhuGFj5NQk=;
 b=B6uKlERavDvKoVnUAsopmtnUrrjgtlfadYYrEW+1d6mx6Dp7WDWk2LSrMYkiBImSJg
 2MX6IMhFhciuSVo2IVdK8RLwB099a6FrmRRNKXdb3xxENLlHDWHjotUUUjAmEQMwuDBe
 aWatdxsvw3ci4l9yYNl7gE2GQyoa2bsMEDG8FHeP41AvnHs8C2Sgi+aqRlOGr1pd27J+
 yWI91Q1FxLXu1h9QAHxbsHEzDLzpqA8mH9ElWsKR9LNn1dG3voNVw2FGedLk/3Q3Qu+D
 4rvRA2DokgYwEo4qjf2yMgW+juWr0Isi0hDCc5TUrVYjbei39zGSC9v0Q+uO43XgTm7E
 Ax0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1zcGRTl/9l2GpF8LYO2/lWbNZQDU6Xe0XQhuGFj5NQk=;
 b=btlu3wLscviRz+kfn7jPXFfepSRKcgtcSBjhHBnhywZdDdTq43tMYflmIUDO4KglFs
 Om8UsEjJTJEGXhIOzYWn8RQjRKUfSYPlgTVRV63ytoAPNGkgmjjp3Z7B7VOkFwXpktVo
 OAL1IyxGpz7RxOv6JmnmdjXOEOF2UTpXEQJLnaLWh5FKhxHDms9CJOD9cADtfU9ujWDa
 mqLQpN4fSpll/W+ZVJdY93EZGRwJ8sFvLJmCEvw1surRevjcVX0UZhxCp8jRni5BfnD5
 Xdhdgu+OG69rwydOdbZJ6Nwnn422rQjfmDmxn0qa22m0oGzFWn2l4RC8mumRgsX1AWV7
 kp/w==
X-Gm-Message-State: AO0yUKVEKz6sYd/NnAgBdBnfJsfeEb+L9lFIHFdU8cVUtOKyn1YhEjDa
 Bsd7hzQhWWmbEm1dLLFOatu1AnbJtTU=
X-Google-Smtp-Source: AK7set8TW5veSVICkPbHeLQ5wN2iSlqP+gqOJcmhQuifsFLIWce6R5b8cWaoCiDrC0NMmPiqdjWQjg==
X-Received: by 2002:a05:6402:3890:b0:4a3:43c1:843e with SMTP id
 fd16-20020a056402389000b004a343c1843emr1507395edb.18.1676890299222; 
 Mon, 20 Feb 2023 02:51:39 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 m9-20020a50c189000000b004ad7af3955dsm832108edf.15.2023.02.20.02.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 02:51:38 -0800 (PST)
Message-ID: <c12aa9b8-65a1-0cdf-8948-15309f16b955@googlemail.com>
Date: Mon, 20 Feb 2023 10:51:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Ben Skeggs <skeggsb@gmail.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <5abbee70-cc84-1528-c3d8-9befd9edd611@googlemail.com>
 <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com>
 <f72fe15b-db1d-56dd-aaf6-3cba68a8bf0a@leemhuis.info>
 <CACO55tvR4ydDOXt=9nbR3n2aFLKrj8zeuGRR_xpezVQBBLrjqg@mail.gmail.com>
 <a6188878-f84c-0fcc-9509-b9d7ab797f4c@leemhuis.info>
 <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
 <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
 <4e786e22-f17a-da76-5129-8fef0c7c825a@googlemail.com>
 <b829633e-ccc4-7a54-1cad-f29254de1251@leemhuis.info>
 <CACO55tsvM07_6mGU3dCgeji0a6B4JJKSDOOBuCHv2Mw3rYbCHg@mail.gmail.com>
 <181bea6a-e501-f5bd-b002-de7a244a921a@googlemail.com>
 <CACO55tsGXfy9-a-nexvcn7pnDGoEWXMqhiQEBwCDkGyOeT1sXQ@mail.gmail.com>
 <dbfc1f77-29f3-7690-c231-55f906a4e7e5@googlemail.com>
 <7f6ec5b3-b5c7-f564-003e-132f112b7cf4@googlemail.com>
 <CACAvsv7Uf5=K44y8YLsiy0aMnc1zvGEQdeDe7RQF=AV+fxxzuQ@mail.gmail.com>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <CACAvsv7Uf5=K44y8YLsiy0aMnc1zvGEQdeDe7RQF=AV+fxxzuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:37 +0000
Subject: Re: [Nouveau] linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 20/02/2023 05:35, Ben Skeggs wrote:
> On Sun, 19 Feb 2023 at 04:55, Chris Clayton <chris2553@googlemail.com> wrote:
>>
>>
>>
>> On 18/02/2023 15:19, Chris Clayton wrote:
>>>
>>>
>>> On 18/02/2023 12:25, Karol Herbst wrote:
>>>> On Sat, Feb 18, 2023 at 1:22 PM Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 15/02/2023 11:09, Karol Herbst wrote:
>>>>>> On Wed, Feb 15, 2023 at 11:36 AM Linux regression tracking #update
>>>>>> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>
>>>>>>> On 13.02.23 10:14, Chris Clayton wrote:
>>>>>>>> On 13/02/2023 02:57, Dave Airlie wrote:
>>>>>>>>> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>>>>>>>> On 10.02.23 20:01, Karol Herbst wrote:
>>>>>>>>>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 08.02.23 09:48, Chris Clayton wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Yeah, looks like it. That's unfortunate, but happens. But there is still
>>>>>>>>>>>>> time to fix it and there is one thing I wonder:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Did any of the nouveau developers look at the netconsole captures Chris
>>>>>>>>>>>>> posted more than a week ago to check if they somehow help to track down
>>>>>>>>>>>>> the root of this problem?
>>>>>>>>>>>>
>>>>>>>>>>>> I did now and I can't spot anything. I think at this point it would
>>>>>>>>>>>> make sense to dump the active tasks/threads via sqsrq keys to see if
>>>>>>>>>>>> any is in a weird state preventing the machine from shutting down.
>>>>>>>>>>>
>>>>>>>>>>> Many thx for looking into it!
>>>>>>>>>>
>>>>>>>>>> Yes, thanks Karol.
>>>>>>>>>>
>>>>>>>>>> Attached is the output from dmesg when this block of code:
>>>>>>>>>>
>>>>>>>>>>         /bin/mount /dev/sda7 /mnt/sda7
>>>>>>>>>>         /bin/mountpoint /proc || /bin/mount /proc
>>>>>>>>>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
>>>>>>>>>>         /bin/echo t > /proc/sysrq-trigger
>>>>>>>>>>         /bin/sleep 1
>>>>>>>>>>         /bin/sync
>>>>>>>>>>         /bin/sleep 1
>>>>>>>>>>         kill $(pidof dmesg)
>>>>>>>>>>         /bin/umount /mnt/sda7
>>>>>>>>>>
>>>>>>>>>> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
>>>>>>>>>>
>>>>>>>>>> I hope this is what you were looking for, but if not, please let me know what you need
>>>>>>>>
>>>>>>>> Thanks Dave. [...]
>>>>>>> FWIW, in case anyone strands here in the archives: the msg was
>>>>>>> truncated. The full post can be found in a new thread:
>>>>>>>
>>>>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
>>>>>>>
>>>>>>> Sadly it seems the info "With runpm=0, both reboot and poweroff work on
>>>>>>> my laptop." didn't bring us much further to a solution. :-/ I don't
>>>>>>> really like it, but for regression tracking I'm now putting this on the
>>>>>>> back-burner, as a fix is not in sight.
>>>>>>>
>>>>>>> #regzbot monitor:
>>>>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
>>>>>>> #regzbot backburner: hard to debug and apparently rare
>>>>>>> #regzbot ignore-activity
>>>>>>>
>>>>>>
>>>>>> yeah.. this bug looks a little annoying. Sadly the only Turing based
>>>>>> laptop I got doesn't work on Nouveau because of firmware related
>>>>>> issues and we probably need to get updated ones from Nvidia here :(
>>>>>>
>>>>>> But it's a bit weird that the kernel doesn't shutdown, because I don't
>>>>>> see anything in the logs which would prevent that from happening.
>>>>>> Unless it's waiting on one of the tasks to complete, but none of them
>>>>>> looked in any way nouveau related.
>>>>>>
>>>>>> If somebody else has any fancy kernel debugging tips here to figure
>>>>>> out why it hangs, that would be very helpful...
>>>>>>
>>>>>
>>>>> I think I've figured this out. It's to do with how my system is configured. I do have an initrd, but the only thing on
>>>>> it is the cpu microcode which, it is recommended, should be loaded early. The absence of the NVidia firmare from an
>>>>> initrd doesn't matter because the drivers for the hardware that need to load firmware are all built as modules, So, by
>>>>> the time the devices are configured via udev, the root partition is mounted and the drivers can get at the firmware.
>>>>>
>>>>> I've found, by turning on nouveau debug and taking a video of the screen as the system shuts down, that nouveau seems to
>>>>> be trying to run the scrubber very very late in the shutdown process. The problem is that by this time, I think the root
>>>>> partition, and thus the scrubber binary, have become inaccessible.
>>>>>
>>>>> I seem to have two choices - either make the firmware accessible on an initrd or unload the module in a shutdown script
>>>>> before the scrubber binary becomes inaccessible. The latter of these is the workaround I have implemented whilst the
>>>>> problem I reported has been under investigation. For simplicity, I think I'll promote my workaround to being the
>>>>> permanent solution.
>>>>>
>>>>> So, apologies (and thanks) to everyone whose time I have taken up with this non-bug.
>>>>>
>>>>
>>>> Well.. nouveau shouldn't prevent the system from shutting down if the
>>>> firmware file isn't available. Or at least it should print a
>>>> warning/error. Mind messing with the code a little to see if skipping
>>>> it kind of works? I probably can also come up with a patch by next
>>>> week.
>>>>
>>> Well, I'd love to but a quick glance at the code caused me to bump into this obscenity:
>>>
>>> int
>>> gm200_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *falcon)
>>> {
>>>         nvkm_falcon_mask(falcon, 0x040, 0x00000000, 0x00000000);
>>>
>>>         if (nvkm_msec(falcon->owner->device, 10,
>>>                 if (!(nvkm_falcon_rd32(falcon, 0x10c) & 0x00000006))
>>>                         break;
>>>         ) < 0)
>>>                 return -ETIMEDOUT;
>>>
>>>         return 0;
>>> }
>>>
>>> nvkm_msec is #defined to nvkm_usec which in turn is #defined to nvkm_nsec where the loop that the break is related to
>>> appears
>>
>> I think someone who knows the code needs to look at this. What I can confirm is that after a freeze, I waited for 90
>> seconds for a timeout to occur, but it didn't.
> Hey,
> 
> Are you able to try the attached patch for me please?
> 
> Thanks,
> Ben.
> 

Thanks Ben.

Yes, this patch fixes the lockup on reboot and poweroff that I've been seeing on my laptop. As you would expect,
offloaded rendering is still working and the discrete GPU is being powered on and off as required.

Thanks.

Reported-by: Chris Clayton <chris2553@googlemail.com>
Tested-by: Chris Clayton <chris2553@googlemail.com>

>>
>>
>> .> Chris
>>>>>
>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>>> --
>>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>>> That page also explains what to do if mails like this annoy you.
>>>>>>>
>>>>>>> #regzbot ignore-activity
>>>>>>>
>>>>>>
>>>>>
>>>>
