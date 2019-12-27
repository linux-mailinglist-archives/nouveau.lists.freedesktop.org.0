Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B4912B2F6
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E126E3A2;
	Fri, 27 Dec 2019 08:14:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C496E182;
 Thu, 21 Nov 2019 12:52:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 04:52:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="216129127"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Nov 2019 04:52:36 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 21 Nov 2019 14:52:36 +0200
Date: Thu, 21 Nov 2019 14:52:36 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20191121125236.GX11621@lahna.fi.intel.com>
References: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121114610.GW11621@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Nov 21, 2019 at 01:46:14PM +0200, Mika Westerberg wrote:
> On Thu, Nov 21, 2019 at 12:34:22PM +0100, Rafael J. Wysocki wrote:
> > On Thu, Nov 21, 2019 at 12:28 PM Mika Westerberg
> > <mika.westerberg@intel.com> wrote:
> > >
> > > On Wed, Nov 20, 2019 at 11:29:33PM +0100, Rafael J. Wysocki wrote:
> > > > > last week or so I found systems where the GPU was under the "PCI
> > > > > Express Root Port" (name from lspci) and on those systems all of that
> > > > > seems to work. So I am wondering if it's indeed just the 0x1901 one,
> > > > > which also explains Mikas case that Thunderbolt stuff works as devices
> > > > > never get populated under this particular bridge controller, but under
> > > > > those "Root Port"s
> > > >
> > > > It always is a PCIe port, but its location within the SoC may matter.
> > >
> > > Exactly. Intel hardware has PCIe ports on CPU side (these are called
> > > PEG, PCI Express Graphics, ports), and the PCH side. I think the IP is
> > > still the same.
> > >
> > > > Also some custom AML-based power management is involved and that may
> > > > be making specific assumptions on the configuration of the SoC and the
> > > > GPU at the time of its invocation which unfortunately are not known to
> > > > us.
> > > >
> > > > However, it looks like the AML invoked to power down the GPU from
> > > > acpi_pci_set_power_state() gets confused if it is not in PCI D0 at
> > > > that point, so it looks like that AML tries to access device memory on
> > > > the GPU (beyond the PCI config space) or similar which is not
> > > > accessible in PCI power states below D0.
> > >
> > > Or the PCI config space of the GPU when the parent root port is in D3hot
> > > (as it is the case here). Also then the GPU config space is not
> > > accessible.
> > 
> > Why would the parent port be in D3hot at that point?  Wouldn't that be
> > a suspend ordering violation?
> 
> No. We put the GPU into D3hot first, then the root port and then turn
> off the power resource (which is attached to the root port) resulting
> the topology entering D3cold.

I don't see that happening in the AML though.

Basically the difference is that when Windows 7 or Linux (the _REV==5
check) then we directly do link disable whereas in Windows 8+ we invoke
LKDS() method that puts the link into L2/L3. None of the fields they
access seem to touch the GPU itself.

LKDS() for the first PEG port looks like this:

   P0L2 = One
   Sleep (0x10)
   Local0 = Zero
   While (P0L2)
   {
	If ((Local0 > 0x04))
	{
	    Break
	}

	Sleep (0x10)
	Local0++
   }

One thing that comes to mind is that the loop can end even if P0L2 is
not cleared as it does only 5 iterations with 16 ms sleep between. Maybe
Sleep() is implemented differently in Windows? I mean Linux may be
"faster" here and return prematurely and if we leave the port into D0
this does not happen, or something. I'm just throwing out ideas :)
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
