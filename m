Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7563D2243B0
	for <lists+nouveau@lfdr.de>; Fri, 17 Jul 2020 21:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21666E2D7;
	Fri, 17 Jul 2020 19:04:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803656E2D7
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595012654;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKQ3UPhST3OvzdKUW3dae3IGuD+EOft4yvMH2GzGai4=;
 b=ANuGBtdKw2VZjmvzvIePyyMeK/+DxxVu7KPI4ecH/ygLCOUkB5XgfXa0y7Dr2O4UAeJYo9
 qLAaXnQvqvqS/R/uYUlYHmsW61AdLc9mACN/UNtpVCmR13HeipREUa7BsivQDGpvL3BRUV
 /zPKCSG7G6nNSMy9jAc3I7el4butJD8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-hIjEJ_XSPgiayG_8ht_TAA-1; Fri, 17 Jul 2020 15:04:12 -0400
X-MC-Unique: hIjEJ_XSPgiayG_8ht_TAA-1
Received: by mail-qk1-f198.google.com with SMTP id q6so6614177qke.21
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VKQ3UPhST3OvzdKUW3dae3IGuD+EOft4yvMH2GzGai4=;
 b=ukQRXf4HNLMGPzFipMH+UG49Mtors3O19l759gLcgBqDjgLi6/FtYkbRoXvYEK0rXe
 DJhRA4pIpJ3OYNIBAoN1T0oeGvuLy8TDQ1VuBFBqiMGf3ZwiUOgMoXufWXPAsd2RAPWN
 gApORNQNxg9Bn6Ly+0xKydrB91vbK9nj8MK2mS79xiq+fPS8jZdpzt2w1sVaOEqpNydV
 BPGDeBGLvC010F48CRKofYNlWUzVgm8NSd05Aq85EOn1ktjrCKSMoiWT7vqsAKk2q7/Z
 HNlO0yH09RtXXr0iAKI4mFgOU8lGk1ToMbkyICFNE0tKEXRvZcd2Gk0dvoPSKUSuRhzX
 TbXQ==
X-Gm-Message-State: AOAM5331sidIb7BOe23RZFowKZzwe3C1RSKHbOmpihJPZBKhhTLJ0UcW
 VtTdbeRkpivxTteZRyP5F0+TSqlZDp1Lp2KCSB4XvAmKJfNFwOb8MG9VlrEBdy+F17XtzpAftZI
 XhnzzcOwvamWFcgUbYGlx4Gewug==
X-Received: by 2002:a37:a046:: with SMTP id j67mr9892612qke.395.1595012652219; 
 Fri, 17 Jul 2020 12:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgtOiKIUn5ao5bCnaTTskTcrkgF6EP4gHfCCcCRRv0vg7ItdvSMNS0FlNgUH04ZXSmho073g==
X-Received: by 2002:a37:a046:: with SMTP id j67mr9892576qke.395.1595012651933; 
 Fri, 17 Jul 2020 12:04:11 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e9sm11311764qtq.70.2020.07.17.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 12:04:11 -0700 (PDT)
Message-ID: <ec6623032131fc3e656713b8ec644cdff89a8066.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Jul 2020 15:04:10 -0400
In-Reply-To: <20200716235440.GA675421@bjorn-Precision-5520>
References: <20200716235440.GA675421@bjorn-Precision-5520>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] nouveau regression with 5.7 caused by "PCI/PM: Assume
 ports without DLL Link Active train links in 100 ms"
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
Reply-To: lyude@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 2020-07-16 at 18:54 -0500, Bjorn Helgaas wrote:
> [+cc Sasha -- stable kernel regression]
> [+cc Patrick, Kai-Heng, LKML]
> 
> On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> > On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > Hi everybody,
> > > 
> > > with the mentioned commit Nouveau isn't able to load firmware onto the
> > > GPU on one of my systems here. Even though the issue doesn't always
> > > happen I am quite confident this is the commit breaking it.
> > > 
> > > I am still digging into the issue and trying to figure out what
> > > exactly breaks, but it shows up in different ways. Either we are not
> > > able to boot the engines on the GPU or the GPU becomes unresponsive.
> > > Btw, this is also a system where our runtime power management issue
> > > shows up, so maybe there is indeed something funky with the bridge
> > > controller.
> > > 
> > > Just pinging you in case you have an idea on how this could break Nouveau
> > > 
> > > most of the times it shows up like this:
> > > nouveau 0000:01:00.0: acr: AHESASC binary failed
> > > 
> > > Sometimes it works at boot and fails at runtime resuming with random
> > > faults. So I will be investigating a bit more, but yeah... I am super
> > > sure the commit triggered this issue, no idea if it actually causes
> > > it.
> > 
> > so yeah.. I reverted that locally and never ran into issues again.
> > Still valid on latest 5.7. So can we get this reverted or properly
> > fixed? This breaks runtime pm for us on at least some hardware.
> 
> Yeah, that stinks.  We had another similar report from Patrick:
> 
>   
> https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com
> 
> Apparently the problem is ec411e02b7a2 ("PCI/PM: Assume ports without
> DLL Link Active train links in 100 ms"), which Patrick found was
> backported to v5.4.49 as 828b192c57e8, and you found was backported to
> v5.7.6 as afaff825e3a4.
> 
> Oddly, Patrick reported that v5.7.7 worked correctly, even though it
> still contains afaff825e3a4.
> 
> I guess in the absence of any other clues we'll have to revert it.
> I hate to do that because that means we'll have slow resume of
> Thunderbolt-connected devices again, but that's better than having
> GPUs completely broken.
> 
> Could you and Patrick open bugzilla.kernel.org reports, attach dmesg
> logs and "sudo lspci -vv" output, and add the URLs to Kai-Heng's
> original report at https://bugzilla.kernel.org/show_bug.cgi?id=206837
> and to this thread?
> 
> There must be a way to fix the slow resume problem without breaking
> the GPUs.

Isn't it possible to tell whether a PCI device is connected through thunderbolt
or not? We could probably get away with just defaulting to 100ms for thunderbolt
devices without DLL Link Active specified, and then default to the old delay
value for non-thunderbolt devices.

> 
> Bjorn
> 

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
