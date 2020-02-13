Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C6915CEAB
	for <lists+nouveau@lfdr.de>; Fri, 14 Feb 2020 00:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788256F895;
	Thu, 13 Feb 2020 23:31:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D547A6F894
 for <nouveau@lists.freedesktop.org>; Thu, 13 Feb 2020 23:31:00 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id l136so7664479oig.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Feb 2020 15:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ut+2rvXwl7BR7vsCTTvgdnkkBILXLMDEZzQhdWPdjI=;
 b=KQ3NdJU2QDHHOl9p0+M33PV1wMgwZA/1HxVLBpribieMwumoe0ZJTM42+FGGMpJxB5
 fgpmBQ8i6tirAD++gaJl0CHVDTJduQ81TOd8cjrCwoOTMbkRu6Awa+B2iUbd6Ts25Chk
 /sQi1aTsYV5PkMneNvdlj+YN+ZV9LZ5Jbf+S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ut+2rvXwl7BR7vsCTTvgdnkkBILXLMDEZzQhdWPdjI=;
 b=RsESQHfws8ynP83ZOjjLvuvjDVfOWdkvE2nMtu5FUmNgGq1kPXLQWsfQDzr1cxkpQM
 x6XmhVLB19RXQSWA25mqlgzn98Vbg9KHQ4VBe3OrzZyWBy5mHZ47VW3YUzMFvEXrrmXm
 Iqe3eA7R7oy02DDQboMtvMeZcFrrAf3exuGlgp9G6/2PszsSEZAV/I8JAmTw/NbfvFkf
 SJ5KJmi5O908vlZZ/SpNPJB0IeS3BmbEoHIFgc5+L/yVCXN7k3BgrPDAYsABe49D6Voi
 h5DwDsGz2q7oFWxcTVUAOqSby/Ct+ErKWdkDzBmw3RtPdrUttGc5lg1u58T8vlN3P6e1
 5O6A==
X-Gm-Message-State: APjAAAVLroi4oStAy3g0mfTH5G0EGBN/CzrZz178+mAIwBw3p057vlzI
 fZT/raLHbh5QXQcUxWPgJd0r+/zrcbh517Qh9V+qsQ==
X-Google-Smtp-Source: APXvYqx1nTcAjLMMkysVcmh1dWd9DsvevHBFUCVWieYNbxpzYJs1oKEWwI8r5hXKOn2wGgekzrJEpQniILwUm9QXC1k=
X-Received: by 2002:aca:af09:: with SMTP id y9mr15379oie.101.1581636660117;
 Thu, 13 Feb 2020 15:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20200209105525.GA1620170@kroah.com>
 <fdb35aa7-7e4a-c44f-94df-bd44585d4bef@nvidia.com>
 <20200213223931.GA3877216@kroah.com>
In-Reply-To: <20200213223931.GA3877216@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Feb 2020 00:30:48 +0100
Message-ID: <CAKMK7uHO0GOA2AzAh3XzWM5p7JkxuCEhz=yA=d4pbkojA4rYUA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: no need to check return value of
 debugfs_create functions
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 11:39 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 13, 2020 at 02:30:09PM -0800, John Hubbard wrote:
> > On 2/9/20 2:55 AM, Greg Kroah-Hartman wrote:
> > > When calling debugfs functions, there is no need to ever check the
> > > return value.  The function can work or not, but the code logic should
> > > never do something different based on this.
> > >
> >
> > Should we follow that line of reasoning further, and simply return void
> > from the debugfs functions--rather than playing whack-a-mole with this
> > indefinitely?
>
> That is what we (well I) have been doing.  Look at all of the changes
> that have happened to include/linux/debugfs.h over the past few
> releases.  I'm slowly winnowing down the api to make it impossible to
> get wrong for this type of thing, and am almost there.
>
> DRM is the big fish left to tackle, I have submitted some patches in the
> past, but lots more cleanup needs to be done to get them into mergable
> shape.  I just need to find the time...

Just to avoid duplication, Wambui (cc'ed) just started working on
this. Expect a lot more void return values and a pile of deleted code
rsn.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
