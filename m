Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BEE22300A
	for <lists+nouveau@lfdr.de>; Fri, 17 Jul 2020 02:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8476E1B7;
	Fri, 17 Jul 2020 00:44:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233F6E12B
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594946645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rmdg41JQUJq8opOuNZqgZDP9AkGwDIAIjz0rPo/9Gto=;
 b=COc5egj66ufcJXjDWAILUQJ0E2ILBLJoYpYm0kznwfBMkLpUW+SN0oqKy9QPQQgVHFZDo1
 KvP+IDKtszbkbSnXbcDC9V1W1NNVsYuSGEQsujkBV/wqE2xM+4EOkHL0lv0O8gFYylK8Q9
 //f/1VAUvf3Tf9YNHQ0H63ukiOsPlXk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-umEnSjZeMVezwlTYsFcrRA-1; Thu, 16 Jul 2020 20:44:03 -0400
X-MC-Unique: umEnSjZeMVezwlTYsFcrRA-1
Received: by mail-qt1-f199.google.com with SMTP id h10so5108080qtc.4
 for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2020 17:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rmdg41JQUJq8opOuNZqgZDP9AkGwDIAIjz0rPo/9Gto=;
 b=UJHLLvlZNXEvG3SOsBA9S4kMBPXIoMfgm9yGY9dJtQRJliYtsJRvr+iro/yN9EOh9p
 ClulbPYPkS+gI5MtEbKtjazhIN/zMqGllPlOcb5IyDGhMgp1/hLfMzencdx/KZ1xLnNU
 JOK18xyvfqM+Dt2pqk9wz01BjVhTPFbwEuBT9X+o+mQBmJ1fDTiSxlTLJb1Rp7n3fg+l
 bEyJtPxjhOtVP1uvUsLLD7Pj9lJXm2torpgUFWXerCBw2yJA3lZmUMaheMRiX3GUtaaS
 GnbzZzbLSofz930nLxccGOrbMV23uwIHdcZqBIqew47n9yH22ZMqPPodvz2KCY5qzpJL
 Nn7w==
X-Gm-Message-State: AOAM531R6mXl5QvEhZofFxnx2fWShswm2Kv8Qhss0eIYMtPQufTTfy58
 UhYMJIn+ERxxBxNeSZ9v/lGViT0XC6f/HTGNBQgQeaHUIEK7YmbNUHguLvuumh5Egw+3Ni+ux9P
 GLSI9OZcxDnD21w0gC/lEkCoqD4oXMQu+I8idQ+n14Q==
X-Received: by 2002:a37:5c04:: with SMTP id q4mr6803741qkb.192.1594946643146; 
 Thu, 16 Jul 2020 17:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8dZ0LhZ5SZX3kNAbkEg8LM0oFyVFb+CHDpbaDZnEmRN7ua1G6U67YJDaEwNT4OIDFAmfBXBb89RLpG2bg22A=
X-Received: by 2002:a37:5c04:: with SMTP id q4mr6803712qkb.192.1594946642833; 
 Thu, 16 Jul 2020 17:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
In-Reply-To: <20200716235440.GA675421@bjorn-Precision-5520>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Jul 2020 02:43:52 +0200
Message-ID: <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
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

On Fri, Jul 17, 2020 at 1:54 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Sasha -- stable kernel regression]
> [+cc Patrick, Kai-Heng, LKML]
>
> On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> > On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
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
>   https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com
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
>

I wouldn't be surprised if this is related to the Intel bridge we
check against for Nouveau.. I still have to check on another laptop
with the same bridge our workaround was required as well but wouldn't
be surprised if it shows the same problem. Will get you the
information from both systems tomorrow then.

> Bjorn
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
