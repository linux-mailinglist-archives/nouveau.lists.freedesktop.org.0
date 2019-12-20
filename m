Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCB1127B18
	for <lists+nouveau@lfdr.de>; Fri, 20 Dec 2019 13:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA646E41D;
	Fri, 20 Dec 2019 12:34:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BADC6E41D
 for <nouveau@lists.freedesktop.org>; Fri, 20 Dec 2019 12:34:08 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 20829 invoked from network);
 20 Dec 2019 13:34:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1576845246; bh=kjcgqhlDm6IKEYAvFoc5PUa/xaCRwa7hKrTLEOb2brE=;
 h=Subject:To:Cc:From;
 b=JY0zJouVwXe0KyvOQkyMSSb8iMqEawDuQJNLRDQAIkhXLjDBN+ZLLGwByIb+U5pw0
 BusNxKmU6y3CFICmY+52lNL46gDBzR9IzTXAUBFNHyF8w4cBWAlwHxLxuQ6MuyhIX7
 9PA0BzBlw6zCma+2DdrP/ud16/XAuzV+Cj5z7Yms=
Received: from no-mans-land.m247.com (HELO me.smtp.wp.pl)
 (mszpak@wp.pl@[185.244.214.240]) (envelope-sender <mszpak@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <linux-pci@vger.kernel.org>; 20 Dec 2019 13:34:06 +0100
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>
References: <c34a6fe1-80dd-a4db-c605-0a13c69e803f@wp.pl>
 <CAKb7UviSYORoeDm1sbDFEzkGd68+DV=StCpzsiaGbA=1VQX3gw@mail.gmail.com>
 <233aafa2-1474-39bf-8ea0-fe1a3ecef167@wp.pl>
 <CAKb7UvgOVrwC91ys19uTAG2p_MRVqcsV_MAHOSL4-m3f+j=dNg@mail.gmail.com>
 <68def665-d236-f3e0-7033-bcb9b9436d1c@wp.pl>
 <CAKb7Uvion7KuwgNaz0G3UD15nnkfM8hfayQgDtgz4d8W6p98bg@mail.gmail.com>
 <20191220060507.GQ2913417@lahna.fi.intel.com>
From: =?UTF-8?Q?Marcin_Zaj=c4=85czkowski?= <mszpak@wp.pl>
Message-ID: <301efb37-43f9-bbc8-b4a3-b41291d660c9@wp.pl>
Date: Fri, 20 Dec 2019 13:34:05 +0100
User-Agent: Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20191220060507.GQ2913417@lahna.fi.intel.com>
Content-Language: en-US
X-WP-MailID: 7071bb4f0c44cc4a89d90dc9e49fdef2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [MQJh]                               
Subject: Re: [Nouveau] Tracking down severe regression in 5.3-rc4/5.4 for
 TU116 - assistance needed
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2019-12-20 07:05, Mika Westerberg wrote:
> On Thu, Dec 19, 2019 at 03:38:10PM -0500, Ilia Mirkin wrote:
>> Let's add Mika and Rafael, as they were responsible for that commit.
>> Mika/Rafael - any ideas? The commit in question is
>>
>> 0617bdede5114a0002298b12cd0ca2b0cfd0395d
> 
> This seems to be
> 
>   Revert "PCI: Add missing link delays required by the PCIe spec"
> 
> Can you try v5.5-rcX without any additional changes? It should include
> the same fix done bit differently (trying to avoid breaking systems
> which caused us to revert the previous one):
> 
>   4827d63891b6 PCI/PM: Add pcie_wait_for_link_delay()
>   ad9001f2f411 PCI/PM: Add missing link delays required by the PCIe spec

Thanks Mika, it looks very promising.
kernel-core-5.5.0-0.rc2.git0.1.fc32.x86_64 boots up without the
aforementioned errors and I can operate normally. I will play more with
5.5 before closing the issue, but at the moment it seems to be fixed.

Before I started digging which commits introduced regression I tested my
system with (then) latest stable kernel-5.4.2-300, but I see your
changes are only in the 5.5 line :).

Big thanks Ilia for your help to pinpoint the problematic commit.

Marcin
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
