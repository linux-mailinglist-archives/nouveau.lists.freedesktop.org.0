Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F21223A8D
	for <lists+nouveau@lfdr.de>; Fri, 17 Jul 2020 13:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE506E118;
	Fri, 17 Jul 2020 11:32:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723626E118
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594985544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYpWDk5YRbEJgevYd6gB8eGgLm0tIiJeUcncZGG+w6o=;
 b=Zo9m0TXPJJdyfI2vhMBODDdUqDMhkSbvu8OpCzT8oxpVhrFVzdDnjVJg4qkpby14IiRFRu
 bC4d/s01t4/r69zk6unJ5OWabKSXnVSJLMdWT/S4Q01Ru/WfOpTwfjgQAPrAYQzZkK7Euz
 lLel8llVsv8HRrCDLrHwGza3MWY9liM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-I0wlTk4ZOsqI2g837_CvkQ-1; Fri, 17 Jul 2020 07:32:21 -0400
X-MC-Unique: I0wlTk4ZOsqI2g837_CvkQ-1
Received: by mail-qv1-f69.google.com with SMTP id l12so5319009qvu.21
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYpWDk5YRbEJgevYd6gB8eGgLm0tIiJeUcncZGG+w6o=;
 b=bVMewq+hjpJe+yieV8maCvDGfKNaJL+SpIPkxrMxCzh/KWH8J4i3ZIWU2z2X2+rR4/
 rvL6b8fa2cNnsdoBc4fvkW4w+ICti1FiSO2IEEdgMSnBuysun2/bqN2k74LpKsMBm3YJ
 K5a8T5DPTxzzdYFJ5Sggz9rQ3aoaZwm43Fqx764G1kArqSFiXSLcrg2L5vxkjSASA+vS
 I7SRBMvdptomYZCHqK1AFEN2a0K2LnQvgOfKE4/UneLI9jChJpHZmyEdtzfXqrYHzUkw
 F7MEPPuN/T/jlYnQFcWEuSPfpVkAxaEG6iNhmHwU8o6r2YOkm02HQBjwcY4K2x2a8wEq
 2nWA==
X-Gm-Message-State: AOAM533DKlU8/3MRV7JBuLAVyM4TZZ7IfRr9v4m9Da6AZ8pEpdU+8DNW
 M7G1Ex9FZLLV1AyZYDG+Mf/lUlnRVMqhDG8EjPzeJa75vYxx0RvhHiD6stuBP3RnoZ1YTaINnop
 1JurinN+1anRG2V30/6qWatoi6Up4lMUZD4XZRlGp4A==
X-Received: by 2002:a37:a589:: with SMTP id o131mr8525056qke.102.1594985541179; 
 Fri, 17 Jul 2020 04:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8U5sWpquWmgK/Rg67k2lvFtnWDq2c6Co4MkYKbyr1oubN2HBDkG+dq9s8lm6gAwtT3o4kndbiPD79JItfOvo=
X-Received: by 2002:a37:a589:: with SMTP id o131mr8525028qke.102.1594985540875; 
 Fri, 17 Jul 2020 04:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
In-Reply-To: <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Jul 2020 13:32:10 +0200
Message-ID: <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Filed at https://bugzilla.kernel.org/show_bug.cgi?id=208597

oddly enough I wasn't able to reproduce it on my XPS 9560, will ping
once something breaks.

On Fri, Jul 17, 2020 at 2:43 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Jul 17, 2020 at 1:54 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > [+cc Sasha -- stable kernel regression]
> > [+cc Patrick, Kai-Heng, LKML]
> >
> > On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> > > On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > Hi everybody,
> > > >
> > > > with the mentioned commit Nouveau isn't able to load firmware onto the
> > > > GPU on one of my systems here. Even though the issue doesn't always
> > > > happen I am quite confident this is the commit breaking it.
> > > >
> > > > I am still digging into the issue and trying to figure out what
> > > > exactly breaks, but it shows up in different ways. Either we are not
> > > > able to boot the engines on the GPU or the GPU becomes unresponsive.
> > > > Btw, this is also a system where our runtime power management issue
> > > > shows up, so maybe there is indeed something funky with the bridge
> > > > controller.
> > > >
> > > > Just pinging you in case you have an idea on how this could break Nouveau
> > > >
> > > > most of the times it shows up like this:
> > > > nouveau 0000:01:00.0: acr: AHESASC binary failed
> > > >
> > > > Sometimes it works at boot and fails at runtime resuming with random
> > > > faults. So I will be investigating a bit more, but yeah... I am super
> > > > sure the commit triggered this issue, no idea if it actually causes
> > > > it.
> > >
> > > so yeah.. I reverted that locally and never ran into issues again.
> > > Still valid on latest 5.7. So can we get this reverted or properly
> > > fixed? This breaks runtime pm for us on at least some hardware.
> >
> > Yeah, that stinks.  We had another similar report from Patrick:
> >
> >   https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com
> >
> > Apparently the problem is ec411e02b7a2 ("PCI/PM: Assume ports without
> > DLL Link Active train links in 100 ms"), which Patrick found was
> > backported to v5.4.49 as 828b192c57e8, and you found was backported to
> > v5.7.6 as afaff825e3a4.
> >
> > Oddly, Patrick reported that v5.7.7 worked correctly, even though it
> > still contains afaff825e3a4.
> >
> > I guess in the absence of any other clues we'll have to revert it.
> > I hate to do that because that means we'll have slow resume of
> > Thunderbolt-connected devices again, but that's better than having
> > GPUs completely broken.
> >
> > Could you and Patrick open bugzilla.kernel.org reports, attach dmesg
> > logs and "sudo lspci -vv" output, and add the URLs to Kai-Heng's
> > original report at https://bugzilla.kernel.org/show_bug.cgi?id=206837
> > and to this thread?
> >
> > There must be a way to fix the slow resume problem without breaking
> > the GPUs.
> >
>
> I wouldn't be surprised if this is related to the Intel bridge we
> check against for Nouveau.. I still have to check on another laptop
> with the same bridge our workaround was required as well but wouldn't
> be surprised if it shows the same problem. Will get you the
> information from both systems tomorrow then.
>
> > Bjorn
> >

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
