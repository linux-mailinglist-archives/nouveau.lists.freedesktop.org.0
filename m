Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4359228098
	for <lists+nouveau@lfdr.de>; Tue, 21 Jul 2020 15:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2676E1F9;
	Tue, 21 Jul 2020 13:08:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500626E1F9;
 Tue, 21 Jul 2020 13:08:52 +0000 (UTC)
IronPort-SDR: fVHMgPKBxIS2Se6vDMu7BPSHv492PH3izy2kLHWFv1mFw3B4DXaq7B4+PmYTEFtXkW8wcPxmrR
 EOMhRJtTTZMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="130192059"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; d="scan'208";a="130192059"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 06:08:51 -0700
IronPort-SDR: FscKyFSJYpwm0edcPqe8S2lioAjregQkXbQ0CxU62nEOHXi0ZBMcv3DeLh85gLVtyKSo/Tichb
 A0h4lCsEzetA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; d="scan'208";a="392343948"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Jul 2020 06:08:47 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 21 Jul 2020 16:08:47 +0300
Date: Tue, 21 Jul 2020 16:08:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20200721130847.GK5180@lahna.fi.intel.com>
References: <20200716235440.GA675421@bjorn-Precision-5520>
 <ec6623032131fc3e656713b8ec644cdff89a8066.camel@redhat.com>
 <20200717195209.vmtyfmgweoo645lh@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717195209.vmtyfmgweoo645lh@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 Linux PCI <linux-pci@vger.kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 09:52:09PM +0200, Lukas Wunner wrote:
> On Fri, Jul 17, 2020 at 03:04:10PM -0400, Lyude Paul wrote:
> > Isn't it possible to tell whether a PCI device is connected through
> > thunderbolt or not? We could probably get away with just defaulting
> > to 100ms for thunderbolt devices without DLL Link Active specified,
> > and then default to the old delay value for non-thunderbolt devices.
> 
> pci_is_thunderbolt_attached()

That only works with some devices. I think we should try to keep the
fact that some PCIe links may be tunneled over TBT/USB4 transparent to
the PCI core and try to treat them as "standard" PCIe links if possible
at all :)
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
