Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADB12B32D
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659416E3FC;
	Fri, 27 Dec 2019 08:14:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B446E027;
 Mon, 21 Oct 2019 12:06:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 05:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="209431575"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 05:06:11 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 15:06:11 +0300
Date: Mon, 21 Oct 2019 15:06:11 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20191021120611.GB2819@lahna.fi.intel.com>
References: <20191016144449.24646-1-kherbst@redhat.com>
 <20191021114017.GY2819@lahna.fi.intel.com>
 <CACO55tt2iGcySugTAb1khEYpiGoq6Os3upG5fGq+0PbE2gyyeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tt2iGcySugTAb1khEYpiGoq6Os3upG5fGq+0PbE2gyyeQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: Re: [Nouveau] [PATCH v3] pci: prevent putting nvidia GPUs into
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2019 at 02:00:46PM +0200, Karol Herbst wrote:
> On Mon, Oct 21, 2019 at 1:40 PM Mika Westerberg
> <mika.westerberg@intel.com> wrote:
> >
> > Hi Karol,
> >
> > Sorry for commenting late, I just came back from vacation.
> >
> > On Wed, Oct 16, 2019 at 04:44:49PM +0200, Karol Herbst wrote:
> > > Fixes state transitions of Nvidia Pascal GPUs from D3cold into higher device
> > > states.
> > >
> > > v2: convert to pci_dev quirk
> > >     put a proper technical explanation of the issue as a in-code comment
> > > v3: disable it only for certain combinations of intel and nvidia hardware
> > >
> > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> > > Cc: Mika Westerberg <mika.westerberg@intel.com>
> > > Cc: linux-pci@vger.kernel.org
> > > Cc: linux-pm@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > ---
> > >  drivers/pci/pci.c    | 11 ++++++++++
> > >  drivers/pci/quirks.c | 52 ++++++++++++++++++++++++++++++++++++++++++++
> >
> > I may be missing something but why you can't do this in the nouveau
> > driver itself?
> 
> What do you mean precisely? Move the quirk into nouveau, but keep the
> changes to pci core?

No, just block runtime PM from the device in nouveau driver.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
