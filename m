Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05E12B31A
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F876E369;
	Fri, 27 Dec 2019 08:14:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115B6E0BC;
 Mon, 21 Oct 2019 15:46:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 08:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; d="scan'208";a="209463506"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 08:46:07 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 18:46:06 +0300
Date: Mon, 21 Oct 2019 18:46:06 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20191021154606.GT2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com>
 <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
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
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2019 at 04:49:09PM +0200, Karol Herbst wrote:
> On Mon, Oct 21, 2019 at 4:09 PM Mika Westerberg
> <mika.westerberg@intel.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 03:54:09PM +0200, Karol Herbst wrote:
> > > > I really would like to provide you more information about such
> > > > workaround but I'm not aware of any ;-) I have not seen any issues like
> > > > this when D3cold is properly implemented in the platform.  That's why
> > > > I'm bit skeptical that this has anything to do with specific Intel PCIe
> > > > ports. More likely it is some power sequence in the _ON/_OFF() methods
> > > > that is run differently on Windows.
> > >
> > > yeah.. maybe. I really don't know what's the actual root cause. I just
> > > know that with this workaround it works perfectly fine on my and some
> > > other systems it was tested on. Do you know who would be best to
> > > approach to get proper documentation about those methods and what are
> > > the actual prerequisites of those methods?
> >
> > Those should be documented in the ACPI spec. Chapter 7 should explain
> > power resources and the device power methods in detail.
> 
> either I looked up the wrong spec or the documentation isn't really
> saying much there.

Well it explains those methods, _PSx, _PRx and _ON()/_OFF(). In case of
PCIe device you also want to check PCIe spec. PCIe 5.0 section 5.8 "PCI
Function Power State Transitions" has a picture about the supported
power state transitions and there we can find that function must be in
D3hot before it can be transitioned into D3cold so if the _OFF() for
example blindly assumes that the device is in D0 when it is called, it
is a bug in the BIOS.

BTW, where can I find acpidump of such system?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
