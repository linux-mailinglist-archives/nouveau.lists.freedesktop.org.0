Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCDD12B2C1
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4356E038;
	Fri, 27 Dec 2019 08:13:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8346E340;
 Wed, 20 Nov 2019 11:51:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 03:51:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="215772771"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 20 Nov 2019 03:51:27 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 20 Nov 2019 13:51:27 +0200
Date: Wed, 20 Nov 2019 13:51:27 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20191120115127.GD11621@lahna.fi.intel.com>
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120112212.GA11621@lahna.fi.intel.com>
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

On Wed, Nov 20, 2019 at 01:22:16PM +0200, Mika Westerberg wrote:
>             If (((OSYS <= 0x07D9) || ((OSYS == 0x07DF) && (_REV == 
>                 0x05))))
>             {

The OSYS comes from this (in DSDT):

                If (_OSI ("Windows 2009"))
                {
                    OSYS = 0x07D9
                }

                If (_OSI ("Windows 2012"))
                {
                    OSYS = 0x07DC
                }

                If (_OSI ("Windows 2013"))
                {
                    OSYS = 0x07DD
                }

                If (_OSI ("Windows 2015"))
                {
                    OSYS = 0x07DF
                }

So I guess this particular check tries to identify Windows 7 and older,
and Linux.

>                 If ((PIOF == Zero))
>                 {
>                     P0LD = One
>                     TCNT = Zero
>                     While ((TCNT < LDLY))
>                     {
>                         If ((P0LT == 0x08))
>                         {
>                             Break
>                         }
> 
>                         Sleep (0x10)
>                         TCNT += 0x10
>                     }
> 
>                     P0RM = One
>                     P0AP = 0x03
>                 }
>                 ElseIf ((PIOF == One))
>                 {
>                     P1LD = One
>                     TCNT = Zero
>                     While ((TCNT < LDLY))
>                     {
>                         If ((P1LT == 0x08))
>                         {
>                             Break
>                         }
> 
>                         Sleep (0x10)
>                         TCNT += 0x10
>                     }
> 
>                     P1RM = One
>                     P1AP = 0x03
>                 }
>                 ElseIf ((PIOF == 0x02))
>                 {
>                     P2LD = One
>                     TCNT = Zero
>                     While ((TCNT < LDLY))
>                     {
>                         If ((P2LT == 0x08))
>                         {
>                             Break
>                         }
> 
>                         Sleep (0x10)
>                         TCNT += 0x10
>                     }
> 
>                     P2RM = One
>                     P2AP = 0x03
>                 }
> 
>                 If ((PBGE != Zero))
>                 {
>                     If (SBDL (PIOF))
>                     {
>                         MBDL = GMXB (PIOF)
>                         PDUB (PIOF, MBDL)
>                     }
>                 }
>             }
>             Else
>             {
>                 LKDS (PIOF)
>             }
> 
>             If ((DerefOf (SCLK [Zero]) != Zero))
>             {
>                 PCRO (0xDC, 0x100C, DerefOf (SCLK [One]))
>                 Sleep (0x10)
>             }
> 
>             GPPR (PIOF, Zero)
>             If ((OSYS != 0x07D9))
>             {
>                 DIWK (PIOF)
>             }
> 
>             \_SB.SGOV (0x01010004, Zero)
>             Sleep (0x14)
>             Return (Zero)
>         }
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
