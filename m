Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B856A1394D7
	for <lists+nouveau@lfdr.de>; Mon, 13 Jan 2020 16:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F376F89131;
	Mon, 13 Jan 2020 15:32:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87CF89131
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jan 2020 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578929561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ugGRc3ZSBpA03LgnAY27K4MxINi4CuEFoptsSyvb9I=;
 b=YqWjnF+E6rs8uWLGwyFotSJmAxfQk6KZErX6jODQY76qSiTEz/lFaYIoxzYaIzpXxrhilt
 OZyCF7yxyh/kshfj0iFtr4A02fZDMBHxOMoPEcozUzjCoYTfSPtj6w2pXXHildijlIOeUl
 AbP925qEf5yEnEXvlo3mZsGBdxHUlUI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-2MHk1mnvMV68EcD7u8Xuxw-1; Mon, 13 Jan 2020 10:32:40 -0500
Received: by mail-qt1-f198.google.com with SMTP id l25so6766293qtu.0
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jan 2020 07:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElsdEkFyMX9PyqBKUyWZEu82iD4Q0YddLseGJka/eAI=;
 b=G/a9ZDKs0kDfB//1K3qxxbaee1OicgydIjupsfHiFWni9Rwgo0uB+G2SJmAMZCHDP6
 vE8sa9GimyfrpSIGZBcvb7KRHMGD0gBQBVCxEdtY36F3N4Omy2Wrp3P85iATVdY6fMYr
 MVWdM09VUjnzgkcRgeq6e1vQrZImOr6DOBX7AdmnTgxsZlbwfzx4pjmyj/pQip8zXEvz
 m575MobAwGUrJLT/jRAw8tqdD00h+THxrD73LkR9s6sMd9m+eQsiJnanUIUjausgPJR5
 9wvrP3y9esisaSRLyg+g5WwFrCy7HBlneXkb35s6dJTq21eIHFvP7MFb5uH6pym3ek9s
 KSiQ==
X-Gm-Message-State: APjAAAW57Xl1qTMJcKXAwYRNGYeOMyf4/fLWin/9YSmFLmBZ+tu8Lgw3
 hxyPQ6eVqrTy9yGI9OxOABSlG4ZoI8Whz3kxuWvH+FLFIXSS64LcHFIWRqqd1FSoaRsLZLKYa92
 rWd9R6jHPVlSOzIqJmT45ZG5nas8mymJF7xIZmEuPdw==
X-Received: by 2002:a37:9245:: with SMTP id u66mr12325309qkd.102.1578929560032; 
 Mon, 13 Jan 2020 07:32:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqytL56xMC0vF1glxTM38WsY2Ix40Z1naBdqh2T+YigaQEOs8RJRhNMIOMubvldRvknv5G4xQqo3cppMYY9Rex0=
X-Received: by 2002:a37:9245:: with SMTP id u66mr12325263qkd.102.1578929559700; 
 Mon, 13 Jan 2020 07:32:39 -0800 (PST)
MIME-Version: 1.0
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
 <20191127114856.GZ11621@lahna.fi.intel.com>
 <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
 <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
 <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
 <CAJZ5v0hcONxiWD+jpBe62H1SZ-84iNxT+QCn8mcesB1C7SVWjw@mail.gmail.com>
 <CAPM=9txefUg9_EO82an3b313mZz7J7-ydTuJtWD-hOQwE4QXkQ@mail.gmail.com>
 <CACO55tvhSM0aATBOK05-05aOc6LeN67=US2zO2jqXKWGTpUZFw@mail.gmail.com>
In-Reply-To: <CACO55tvhSM0aATBOK05-05aOc6LeN67=US2zO2jqXKWGTpUZFw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 13 Jan 2020 16:31:50 +0100
Message-ID: <CACO55tsCRzSOz4GcLuuvGP3hfbz8gYtYXqtYHy5XCpCi3tmPeA@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
X-MC-Unique: 2MHk1mnvMV68EcD7u8Xuxw-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

okay.. so checking whatever is the difference with _REV being 5
(meaning the firmware uses the legacy paths) doesn't help in any way.
It's using a different method to turn the link of and the other ACPI
variables touched either point to undocumented registers on the PCI
bridge or internal ACPI memory...

so, anybody with any other ideas? I really wished the nvidia driver
would enable runpm on pre turing GPUs, but that's sadly not the case
and on Turing things seem to be totally different, so it wouldn't help
to check there as well... *sigh*

On Tue, Dec 10, 2019 at 9:49 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Tue, Dec 10, 2019 at 8:58 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Mon, 9 Dec 2019 at 21:39, Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Mon, Dec 9, 2019 at 12:17 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > anybody any other ideas?
> > >
> > > Not yet, but I'm trying to collect some more information.
> > >
> > > > It seems that both patches don't really fix
> > > > the issue and I have no idea left on my side to try out. The only
> > > > thing left I could do to further investigate would be to reverse
> > > > engineer the Nvidia driver as they support runpm on Turing+ GPUs now,
> > > > but I've heard users having similar issues to the one Lyude told us
> > > > about... and I couldn't verify that the patches help there either in a
> > > > reliable way.
> > >
> > > It looks like the newer (8+) versions of Windows expect the GPU driver
> > > to prepare the GPU for power removal in some specific way and the
> > > latter fails if the GPU has not been prepared as expected.
> > >
> > > Because testing indicates that the Windows 7 path in the platform
> > > firmware works, it may be worth trying to do what it does to the PCIe
> > > link before invoking the _OFF method for the power resource
> > > controlling the GPU power.
> > >
> >
> > Remember the pre Win8 path required calling a DSM method to actually
> > power the card down, I think by the time we reach these methods in
> > those cases the card is already gone.
> >
> > Dave.
> >
>
> The point was that the firmware seems to do more in the legacy paths
> and maybe we just have to do those things inside the driver instead
> when using the new method. Also the _DSM call just wraps around the
> interfaces on newer firmware anyway. The OS check is usually what
> makes the difference. I might be wrong about the _DSM call just
> wrapping though, but I think I saw it at least in some firmware at
> some point.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
