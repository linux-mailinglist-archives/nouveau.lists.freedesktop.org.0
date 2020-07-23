Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4422B7CD
	for <lists+nouveau@lfdr.de>; Thu, 23 Jul 2020 22:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1936D6E859;
	Thu, 23 Jul 2020 20:31:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BAF6E284
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2020 20:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595536274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=40t+4qcg6UR1VcXiSRsIIDp9z0DXZ4q6WAM4TN0/6lk=;
 b=aYaMfDhP4PCilBwMubvz0FD+P4GpQRfw20FIQTQ+PpuqIgiNSAXkd1QQmVNveyPznj11Q6
 lXB3dCH9k6o2kW/y6cMQy9vGH3t36diNlVEBKbenyl05sdIa/5Zzl80XgKhN3zCXfhltQv
 g/PDaEStFfkM1lFZMXQyYLPYdV0UdVw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-mD75HTckMyqIW5kNVVjqLg-1; Thu, 23 Jul 2020 16:31:10 -0400
X-MC-Unique: mD75HTckMyqIW5kNVVjqLg-1
Received: by mail-qt1-f197.google.com with SMTP id q7so4500196qtq.14
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2020 13:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40t+4qcg6UR1VcXiSRsIIDp9z0DXZ4q6WAM4TN0/6lk=;
 b=d0tqNgFQtbqSfHw9mPxvFNp95BCoLBSXNSZMD58Yn8Z4mBgDT0nwLJ/3RALeJit6MZ
 8tNjIrtbWofIw3keGSq32FaYuO+zWTCg9ce+jHFtsYTyMcEcnCfFdBjALh7vjZzsPc1a
 JVrWwg9nuEZfOxJrzQU5HxwrwYmDLTqwob85S3KTuGRQ1LD84gvQ8zYeAuYVElW/3s2Z
 jWAaEjGSb6E9/JcXcV7ppO26L8eIh3PsOVaG2pHruih/CmYoOdF2uB/nQp/ZPsoF58/t
 fRIVdl3JlIOyqf+ITVCK6RleKkJBsVm2D0eSmWrxisnNO1M59H7SFaXe6EDXtD9oPBx/
 jtsQ==
X-Gm-Message-State: AOAM530tpR4cTrNMOWbFmaSeABweK7bxVgKiS4p2qzvYKz+1oNnHBjeb
 I6li4Ti8MxjXaZq41/iI2fHWg99+a9pKa+oEv5Ctfv+9iTSJErM4DeMvSFHRDNczawkq5d/CAsS
 /Il3bwJQbB0dEsacWw0OeXMxQV0ba5iljIEFv+1U6OQ==
X-Received: by 2002:a37:5c04:: with SMTP id q4mr7263416qkb.192.1595536270053; 
 Thu, 23 Jul 2020 13:31:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaz+FKwj1+Qpe9+JR57Hg1bCOgF5rhbZUwIe/feWxQzxhiCYW2p0q4YNTbBH3ZcWu7BRmV4VUvG7uvN9PukuM=
X-Received: by 2002:a37:5c04:: with SMTP id q4mr7263386qkb.192.1595536269773; 
 Thu, 23 Jul 2020 13:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
 <d3253a47-09ff-8bc7-3ca1-a80bdc09d1c2@gmail.com>
 <20200722092507.GC5180@lahna.fi.intel.com>
In-Reply-To: <20200722092507.GC5180@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 23 Jul 2020 22:30:58 +0200
Message-ID: <CACO55tsv63VP93F7xJ3nfZ7SkOk0c6WkgvuP+8fY14gypmn4Fg@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
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
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 11:25 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2020 at 01:37:12PM -0500, Patrick Volkerding wrote:
> > On 7/21/20 10:27 AM, Mika Westerberg wrote:
> > > On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > >> Sure thing. Also, feel free to let me know if you'd like access to one of the
> > >> systems we saw breaking with this patch - I'm fairly sure I've got one of them
> > >> locally at my apartment and don't mind setting up AMT/KVM/SSH
> > > Probably no need for remote access (thanks for the offer, though). I
> > > attached a test patch to the bug report:
> > >
> > >   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> > >
> > > that tries to work it around (based on the ->pm_cap == 0). I wonder if
> > > anyone would have time to try it out.
> >
> >
> > Hi Mika,
> >
> > I can confirm that this patch applied to 5.4.52 fixes the issue with
> > hybrid graphics on the Thinkpad X1 Extreme gen2.
>
> Great, thanks for testing!
>

yeah, works on the P1G2 as well.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
