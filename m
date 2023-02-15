Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AA697A70
	for <lists+nouveau@lfdr.de>; Wed, 15 Feb 2023 12:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD8510E06D;
	Wed, 15 Feb 2023 11:10:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B4E10E06D
 for <nouveau@lists.freedesktop.org>; Wed, 15 Feb 2023 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676459399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIFgXh/l40GhiL7GOoC/0iUQI17ikABcGGlDWzu5xTA=;
 b=MbLVcKxnBkdCmV9CkWZSB0Anv7vsH/eCWW5wUNXIx88XkyT6dWVQjFJ5GXS+FxViK3zsa5
 bS0pXPd2v1qSfn8UxDSZG2L8ALEIMK8bpzOPiqdX5ZRF16cUL6H9YBoB49hxxeO085p0nq
 SLPfhZsTzXY77iW5W7LPxsyypoyGN/Y=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-3l3XO77lP5WIr6p15UmLhw-1; Wed, 15 Feb 2023 06:09:58 -0500
X-MC-Unique: 3l3XO77lP5WIr6p15UmLhw-1
Received: by mail-lf1-f70.google.com with SMTP id
 g27-20020a0565123b9b00b004d861df2daeso7926270lfv.13
 for <nouveau@lists.freedesktop.org>; Wed, 15 Feb 2023 03:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIFgXh/l40GhiL7GOoC/0iUQI17ikABcGGlDWzu5xTA=;
 b=UA4WNAcPc4Y7K8VGgKF8Q8YDhHmNTyZweT+JCpqMIR7Jty0GxtnFtWAcCouTUlFNdv
 RPjo69qkJSEgBfpkvLJ9aQRXZK9eYs1AEbCTCQXuhzjbGuU7Y4Bk/0elRDyMyWvtLAvR
 5amdhAJNQSnMy/iEeIx8u6+qc0rK/bHeePkv52T3ey3rJrBm9PaI5K93hyzbIam5K5Wg
 s6tykEpF9qfivMIdx9CHPGLw7BCi4sFuYuFF/3sBDZ4P9SWavLuh1VUtKkXZ0GfS7ta4
 ILvFhlTpqjm0chyvSJl+T60hTg7L68/Use7JrKpMjP7x8ox2FF4DJcSkkIooeKRvRmqy
 /yhw==
X-Gm-Message-State: AO0yUKWdTHVtaj32vIQHLcyuCsNZAQ/eVsu+onRLiuD6S8/+/XJVXTwG
 Ppjcw+99VzDvpCP5LqORI6VzGY9ZxiI67AMb891xeI11gScP42vjUHhy9+oIqw1Uj7hhEUeqfoK
 JTMj7rUrllT4n8JIOeb9Ne7PHzLCLbgX5mKPVf8q6/A==
X-Received: by 2002:a2e:b803:0:b0:293:5317:47ab with SMTP id
 u3-20020a2eb803000000b00293531747abmr433606ljo.8.1676459397210; 
 Wed, 15 Feb 2023 03:09:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/9H0SZhUW24BTzDKxz2i3Ak4kG4AuPlENkYIzHIEXR57C28xi1MjzNIGuWTJb6egEAxgh5LbogHsjJtJv3t7E=
X-Received: by 2002:a2e:b803:0:b0:293:5317:47ab with SMTP id
 u3-20020a2eb803000000b00293531747abmr433597ljo.8.1676459396916; Wed, 15 Feb
 2023 03:09:56 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
 <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
 <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com>
 <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
 <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
 <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
 <CACAvsv5iYdF3P8AbyrbYo3zGmYRYhxDWn7WbAR5V9qHpbgBXRA@mail.gmail.com>
 <1632a9ef-2954-c8f0-cdc9-03157c9d8547@googlemail.com>
 <5abbee70-cc84-1528-c3d8-9befd9edd611@googlemail.com>
 <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com>
 <f72fe15b-db1d-56dd-aaf6-3cba68a8bf0a@leemhuis.info>
 <CACO55tvR4ydDOXt=9nbR3n2aFLKrj8zeuGRR_xpezVQBBLrjqg@mail.gmail.com>
 <a6188878-f84c-0fcc-9509-b9d7ab797f4c@leemhuis.info>
 <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
 <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
 <4e786e22-f17a-da76-5129-8fef0c7c825a@googlemail.com>
 <b829633e-ccc4-7a54-1cad-f29254de1251@leemhuis.info>
In-Reply-To: <b829633e-ccc4-7a54-1cad-f29254de1251@leemhuis.info>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 15 Feb 2023 12:09:45 +0100
Message-ID: <CACO55tsvM07_6mGU3dCgeji0a6B4JJKSDOOBuCHv2Mw3rYbCHg@mail.gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Chris Clayton <chris2553@googlemail.com>, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 11:36 AM Linux regression tracking #update
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 13.02.23 10:14, Chris Clayton wrote:
> > On 13/02/2023 02:57, Dave Airlie wrote:
> >> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
> >>>
> >>>
> >>>
> >>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>>> On 10.02.23 20:01, Karol Herbst wrote:
> >>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
> >>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>
> >>>>>> On 08.02.23 09:48, Chris Clayton wrote:
> >>>>>>>
> >>>>>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
> >>>>>>
> >>>>>> Yeah, looks like it. That's unfortunate, but happens. But there is still
> >>>>>> time to fix it and there is one thing I wonder:
> >>>>>>
> >>>>>> Did any of the nouveau developers look at the netconsole captures Chris
> >>>>>> posted more than a week ago to check if they somehow help to track down
> >>>>>> the root of this problem?
> >>>>>
> >>>>> I did now and I can't spot anything. I think at this point it would
> >>>>> make sense to dump the active tasks/threads via sqsrq keys to see if
> >>>>> any is in a weird state preventing the machine from shutting down.
> >>>>
> >>>> Many thx for looking into it!
> >>>
> >>> Yes, thanks Karol.
> >>>
> >>> Attached is the output from dmesg when this block of code:
> >>>
> >>>         /bin/mount /dev/sda7 /mnt/sda7
> >>>         /bin/mountpoint /proc || /bin/mount /proc
> >>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
> >>>         /bin/echo t > /proc/sysrq-trigger
> >>>         /bin/sleep 1
> >>>         /bin/sync
> >>>         /bin/sleep 1
> >>>         kill $(pidof dmesg)
> >>>         /bin/umount /mnt/sda7
> >>>
> >>> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
> >>>
> >>> I hope this is what you were looking for, but if not, please let me know what you need
> >
> > Thanks Dave. [...]
> FWIW, in case anyone strands here in the archives: the msg was
> truncated. The full post can be found in a new thread:
>
> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
>
> Sadly it seems the info "With runpm=0, both reboot and poweroff work on
> my laptop." didn't bring us much further to a solution. :-/ I don't
> really like it, but for regression tracking I'm now putting this on the
> back-burner, as a fix is not in sight.
>
> #regzbot monitor:
> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
> #regzbot backburner: hard to debug and apparently rare
> #regzbot ignore-activity
>

yeah.. this bug looks a little annoying. Sadly the only Turing based
laptop I got doesn't work on Nouveau because of firmware related
issues and we probably need to get updated ones from Nvidia here :(

But it's a bit weird that the kernel doesn't shutdown, because I don't
see anything in the logs which would prevent that from happening.
Unless it's waiting on one of the tasks to complete, but none of them
looked in any way nouveau related.

If somebody else has any fancy kernel debugging tips here to figure
out why it hangs, that would be very helpful...

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
>
> #regzbot ignore-activity
>

