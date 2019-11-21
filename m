Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619412B2B1
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6542489D86;
	Fri, 27 Dec 2019 08:13:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBD66EDD1;
 Thu, 21 Nov 2019 11:17:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 03:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="216114487"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Nov 2019 03:17:40 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 21 Nov 2019 13:17:39 +0200
Date: Thu, 21 Nov 2019 13:17:39 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20191121111739.GT11621@lahna.fi.intel.com>
References: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
 <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
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

On Thu, Nov 21, 2019 at 12:03:52PM +0100, Rafael J. Wysocki wrote:
> On Thu, Nov 21, 2019 at 11:14 AM Mika Westerberg
> <mika.westerberg@intel.com> wrote:
> >
> > On Wed, Nov 20, 2019 at 10:36:31PM +0100, Karol Herbst wrote:
> > > with the branch and patch applied:
> > > https://gist.githubusercontent.com/karolherbst/03c4c8141b0fa292d781badfa186479e/raw/5c62640afbc57d6e69ea924c338bd2836e770d02/gistfile1.txt
> >
> > Thanks for testing. Too bad it did not help :( I suppose there is no
> > change if you increase the delay to say 1s?
> 
> Well, look at the original patch in this thread.
> 
> What it does is to prevent the device (GPU in this particular case)
> from going into a PCI low-power state before invoking AML to power it
> down (the AML is still invoked after this patch AFAICS), so why would
> that have anything to do with the delays?

Yes, I know what it does :) I was just thinking that maybe it's still
the link that does not come up when we go back to D0 I guess that's not
the case here.

> The only reason would be the AML running too early, but that doesn't
> seem likely.  IMO more likely is that the AML does something which
> cannot be done to a device in a PCI low-power state.

It may very well be the case.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
