Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8AE4A34FE
	for <lists+nouveau@lfdr.de>; Sun, 30 Jan 2022 08:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4E710EC60;
	Sun, 30 Jan 2022 07:49:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9026B10E12D
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jan 2022 15:20:07 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4JmJ0l215vz9vC9L
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jan 2022 15:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGUQnp14mi3D for <nouveau@lists.freedesktop.org>;
 Sat, 29 Jan 2022 09:20:07 -0600 (CST)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4JmJ0l0Cnzz9vC94
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jan 2022 09:20:07 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4JmJ0l0Cnzz9vC94
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4JmJ0l0Cnzz9vC94
Received: by mail-io1-f70.google.com with SMTP id
 r139-20020a6b2b91000000b0060445aa664dso6550313ior.9
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jan 2022 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20wQ8WZNH8c/YveUfuB2Rg0Bs7I2bsmcYwLA+aQphic=;
 b=d3il72roGpj8pWwzz+3AlGFNU/iwFzERKoAsaHqd/1DbniAg3OpTs+1bmtG47U/avD
 2CzZG/vD36IfbHoyqnhp+p/WATmK8L9IS0v20kipDl3Ip45FWvFRpsYc2aOfPCByjr6Z
 KO7C47qt+P++6m9m17GT+ZnTM60nGpBXvnA5fdHxNCZ5v0c8whP8v3IftDC3UlX+8rdi
 W8xdRTEnMon6EJuhN5Kaf16lddolrmCy/py+/w8+7O31pYLPSYABHGNOD7kjsfzKlPDo
 wRgRcbc560oKSpxd3YQKDkXcfWSCzH45ytA3UPZPQlar4G3F2WEOUdfZIZsfq/5YIH2e
 FMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20wQ8WZNH8c/YveUfuB2Rg0Bs7I2bsmcYwLA+aQphic=;
 b=filLuq8jhj93PPoBU7rYUoB69fRiJptn4B4auVuf9mDJwTWngO20m6Bk6m5s9icTqh
 cQjWMiscfhlQDMNRU29TFak7JbpHmxC9M7shhziE8FQ0hrYjy8He+P5B7Q7W+VwYkZ3U
 takSFJAacaiKQ2YPmWAOLvG7sl1qroG/ticmF/pa/4Y2uqfmaSg1tqDsmrQ/yDxTyIOh
 Z5DLx7rpHOaY0i+B61NuPDN3l5qj5vxhFQaj5TpFsk05NOg4wBuNaHxfxlABhAtnd1mf
 vh/A9B4txmI5DFVmL6b9KZCo2Ii3Kk4hA4Eff1tbDw8eEKrsiH1yBsGOLYDGoCZdTK+u
 elvw==
X-Gm-Message-State: AOAM530mGqc0M1u1GJ1fSxz5mmLHcTIXTW+3MxIA6xdAwFIENwEwbyHj
 7nJNvPAnri0CLLIf/zlMYWAmKVslNW1nqjkPy73Di9Ea8otvPCpdCdw07xD/seLfCG75m0Np5Im
 dKCdIqKvvi+k8l30YoH6myhQO8Z4MSS89qrOnVrGs//rO9g==
X-Received: by 2002:a05:6e02:b23:: with SMTP id
 e3mr8376081ilu.32.1643469606493; 
 Sat, 29 Jan 2022 07:20:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBBBkjVU1BuOpUNOYZo4iAeHPmRG6ITF+dRQ6D5bU2L3Vx829c0lJ+Tiy3eUtzDtTz7hLvvdsFWNhqFkVnHRw=
X-Received: by 2002:a05:6e02:b23:: with SMTP id
 e3mr8376067ilu.32.1643469606163; 
 Sat, 29 Jan 2022 07:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
 <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
 <CAK8Kejr6E76u2kf_OKxC1RT_qsCWXDf7q4WcTC13-OJz5CseWg@mail.gmail.com>
 <YfVTcUA4MKknEawL@kroah.com>
In-Reply-To: <YfVTcUA4MKknEawL@kroah.com>
From: Kangjie Lu <kjlu@umn.edu>
Date: Sat, 29 Jan 2022 09:19:18 -0600
Message-ID: <CAK8Kejo6p57u8tz1rnV5bhQVO_vz-p1nCsc_G=EvEr1u3FUP9g@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 30 Jan 2022 07:49:46 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexdeucher@gmail.com>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,Greg,

On Sat, Jan 29, 2022 at 8:47 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jan 29, 2022 at 08:18:55AM -0600, Kangjie Lu wrote:
> > On Fri, Jan 28, 2022 at 1:58 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > On Fri, Jan 28, 2022 at 8:54 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > >
> > > > On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > > > >
> > > > > Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> > > > > I pushed this already but I will go ahead and send a revert for this patch.
> > > > > Will cc you on it as well.
> > > >
> > > > This seems short-sighted.  If the patch is valid I see no reason to
> > > > not accept it.  I'm not trying to downplay the mess umn got into, but
> > > > as long as the patch is well scrutinized and fixes a valid issue, it
> > > > should be applied rather than leaving potential bugs in place.
> > > >
> > > > Alex
> > > >
> > >
> > > Even though knowing that malicious code can be introduced via
> > > perfectly fine looking patches, and sometimes one will never spot the
> > > problem, this patch isn't all that bad tbh.
> > >
> > > So should we reject patches out of "policies" or should we just be
> > > extra careful? But not addressing the concerns as Greg pointed out is
> > > also kind of a bad move, but also not knowing what the state of
> > > resolving this mess is anyway.
> >
> >
> > Seeing some discussion here, I feel I owe you some quick updates on
> > the state. We sent three testing patches in August 2020, which is a
> > serious mistake. We never did that again and will never do that again.
> > All other patches including recent ones were sent to fix real bugs,
> > not to introduce problems. Clearly, although most of the patches are
> > valid, some patches are still not good enough, but it is not about
> > malice. Fixing bugs in Linux isn't an easy task and takes so much
> > effort.
> >
> > We did not ignore the concerns pointed out by Greg, and have seriously
> > taken some actions. For example, we explained how our static-analysis
> > tool found the bugs, and members in my research group have internally
> > cross-reviewed the found bugs. We sent these patches after contacting
> > Greg---I thought Greg allowed us to send patches, but also requested
> > us to work on the last process with our administration.
>
> I do not recall saying anything like this at all.

I was referring to an email back to 11/13/2021 where you said
"some memory allocation checks are not ever going to be "resolved" as they are
not "real world" issues. So be aware of that when proposing patches
for these issues."

I optimistically interpreted this as, "you can still submit patches,
but I will personally ignore them". This turns out to be a
misunderstanding. I am sorry for that.

>
> On January 4, I wrote to you and your coworkers on the mailing list
> message https://lore.kernel.org/r/YdQfCGf8qr5zZJef@kroah.com by saying:
>
>         Note that your university is still in many kernel maintainer's
>         ignore-list (myself included, I dug this up as I saw Fei's response.)
>         Please work with your administration and the process that is currently
>         happening in order to give you all the needed training so you will not
>         keep causing these types of basic errors that keep your patches from
>         being accepted.
>
>         *plonk*
>
> And then later in a private email to you on January 5 where you emailed
> Kees and me to try to see if you were allowed to start sending patches
> again, I said:
>
>         A kernel developer with lots of experience has already offered to work
>         with your university.  Hopefully that process has already started, if
>         not, I suggest contacting your administration as they should know who
>         this is.
>
> and then I closed with:
>
>         Right now you all are still on my "ignore email" lists for patches.
>
> The patches recently submitted have been shown to be incomplete and in
> some places, completely wrong.  I have contacted your administration
> about this issue because they asked to know if there were any problems
> in the future at our last discussion.  In that response today, I wrote:
>
>         I know that incompetence can often times be hard to distinguish from
>         malice, but given the track-record here, we are now going to have to
>         treat this as malice.  If it is just incompetence, well, that's
>         something that your organization needs to overcome.
>
>         Either way, this is not something that the Linux kernel community should
>         be forced to endure.
>
> So to be explicit, so you do not misunderstand me somehow:
>
>         No more patches from umn.edu should be accepted into the Linux
>         kernel until further public notice.

This is clear to me.

> They should be considered a
>         "bad actor" given their prior history of submissions and lack of
>         complying with the kernel community's prior requirements to
>         them.

I am sorry for the delay of the last process which is unfortunately
not under the control of the researchers. According to our
administration, the process has started and is moving forward. I hope
that can be done soon.

Thanks.

>
> Is this understood?
>
> greg k-h



-- 
Kangjie Lu
Assistant Professor
Department of Computer Science and Engineering
University of Minnesota
https://www-users.cs.umn.edu/~kjlu
