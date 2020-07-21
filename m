Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827122283C4
	for <lists+nouveau@lfdr.de>; Tue, 21 Jul 2020 17:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0307E6E2DA;
	Tue, 21 Jul 2020 15:28:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531C66E2DA;
 Tue, 21 Jul 2020 15:27:58 +0000 (UTC)
IronPort-SDR: pSyYa058NNcr73FQltGG6KHoVwnkm0ZOgFwRvaxdj/MFbg+8TsB9+N/33JZydi4s5Fj4SwmMla
 BVAN7nOPOLEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="211697222"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="211697222"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 08:27:42 -0700
IronPort-SDR: m9Yv3szcNnwqnBWnMd6YPHjbliYFF5XJkiXvnqC85+KMTFwgkgyG6ChCE/R2uNGy3aLyySdAzB
 PtjfD4EwWf9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="392383055"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Jul 2020 08:27:38 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 21 Jul 2020 18:27:37 +0300
Date: Tue, 21 Jul 2020 18:27:37 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20200721152737.GS5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
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
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> Sure thing. Also, feel free to let me know if you'd like access to one of the
> systems we saw breaking with this patch - I'm fairly sure I've got one of them
> locally at my apartment and don't mind setting up AMT/KVM/SSH

Probably no need for remote access (thanks for the offer, though). I
attached a test patch to the bug report:

  https://bugzilla.kernel.org/show_bug.cgi?id=208597

that tries to work it around (based on the ->pm_cap == 0). I wonder if
anyone would have time to try it out.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
