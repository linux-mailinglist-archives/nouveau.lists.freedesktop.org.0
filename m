Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF41039B2
	for <lists+nouveau@lfdr.de>; Wed, 20 Nov 2019 13:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F566E4BB;
	Wed, 20 Nov 2019 12:12:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0408F6E4AF
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 12:12:05 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-nwmZqdVvOEa_nqNHqxDbFw-1; Wed, 20 Nov 2019 07:12:03 -0500
Received: by mail-qk1-f198.google.com with SMTP id p68so15719299qkf.9
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 04:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VF+bQZFHPewNnM9aH9KyZQntlM8F2dUwAxVJVb/6oKY=;
 b=QvEMuHtBaRFFr3hc2AWTrC3NDSiOwk4fHgg07S/5gm8Yhejjuk6uL2xEjY7tINFGyO
 aT5pP8Q/WGYi5wZVvcmqqApEM5PjJmI+IZeFJvb/8lsyRET2ZEcqUNf4Uooigk8X2+lJ
 YmV0mgNz8fopLp+HzxXC57qbB0pfH/orjR0UHQj2xVaaupWmsNFT+7LPo6ve159iJr8Z
 wIxt6jFXyCkEpgW+jWOwSgv3u6vIntYHD8oi/oSFF4xLmBgjpR93FtOYhRV2xH6xFqAK
 gFJNKkY9aNvsowE3/OYhrtpPCd7cBetMBxt6QDjMzm3XqPfXy/j97Vbb6sTSXdh5gee1
 xQ6A==
X-Gm-Message-State: APjAAAXQjmjE5ib6jGQ7VPh1yMg86xSUC7eaZIbX8NbhMzduaer9jCmm
 cO4y/R0RG8A8yu0/REpnumYqz/Do1oqIBTHT2hkSqf/gD7g6bPaCh4Kr7Lbr1EVVqAktzlLvDAI
 mV1hC70VYoUD4BIhyJ8ZomI6vhIVBcsuO/jC2deV3IQ==
X-Received: by 2002:a37:9083:: with SMTP id s125mr2044112qkd.192.1574251923299; 
 Wed, 20 Nov 2019 04:12:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBAA4TCCMTkJLA3fk7uQ/livSO00sZJsFKKfFUtKcydvGnjFRyWiHk4b/E6hpfbS10eFj88YdwU+FKUdPz0cI=
X-Received: by 2002:a37:9083:: with SMTP id s125mr2044079qkd.192.1574251923040; 
 Wed, 20 Nov 2019 04:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
In-Reply-To: <20191120120913.GE11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 13:11:52 +0100
Message-ID: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: nwmZqdVvOEa_nqNHqxDbFw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574251925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VF+bQZFHPewNnM9aH9KyZQntlM8F2dUwAxVJVb/6oKY=;
 b=Im2tZb9Gcw8uWoW1B1bThyokHLQK7tkB5fQ4HamJjgG06Ytp5TzBvpxVN0WDMVPYByu6Vu
 QpnV6XoD2UxWKgH1G+aYIJP1flGNvu3Yfnu0DSccJd+E+/7wiHlr/JJETjz5W/b19NpbVT
 g0J5OS5r6BcJiNNul9rRLwWP2qIB6jo=
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTowOSBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6
NTg6MDBQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gb3ZlcmFsbCwgd2hhdCBJIHJl
YWxseSB3YW50IHRvIGtub3cgaXMsIF93aHlfIGRvZXMgaXQgd29yayBvbiB3aW5kb3dzPwo+Cj4g
U28gZG8gSSA7LSkKPgo+ID4gT3Igd2hhdCBhcmUgd2UgZG9pbmcgZGlmZmVyZW50bHkgb24gTGlu
dXggc28gdGhhdCBpdCBkb2Vzbid0IHdvcms/IElmCj4gPiBhbnlib2R5IGhhcyBhbnkgaWRlYSBv
biBob3cgd2UgY291bGQgZGlnIGludG8gdGhpcyBhbmQgZmlndXJlIGl0IG91dAo+ID4gb24gdGhp
cyBsZXZlbCwgdGhpcyB3b3VsZCBwcm9iYWJseSBhbGxvdyB1cyB0byBnZXQgY2xvc2VyIHRvIHRo
ZSByb290Cj4gPiBjYXVzZT8gbm8/Cj4KPiBIYXZlIHlvdSB0cmllZCB0byB1c2UgdGhlIGFjcGlf
cmV2X292ZXJyaWRlIHBhcmFtZXRlciBpbiB5b3VyIHN5c3RlbSBhbmQKPiBkb2VzIGl0IGhhdmUg
YW55IGVmZmVjdD8KPgo+IEFsc28gZGlkIHlvdSB0cnkgdG8gdHJhY2UgdGhlIEFDUEkgX09OL19P
RkYoKSBtZXRob2RzPyBJIHRoaW5rIHRoYXQKPiBzaG91bGQgaG9wZWZ1bGx5IHJldmVhbCBzb21l
dGhpbmcuCj4KCkkgdGhpbmsgSSBkaWQgaW4gdGhlIHBhc3QgYW5kIGl0IHNlZW1lZCB0byBoYXZl
IHdvcmtlZCwgdGhlcmUgaXMganVzdApvbmUgYmlnIGlzc3VlIHdpdGggdGhpczogaXQncyBhIERl
bGwgc3BlY2lmaWMgd29ya2Fyb3VuZCBhZmFpaywgYW5kCnRoaXMgaXNzdWUgcGxhZ3VlcyBub3Qg
anVzdCBEZWxsLCBidXQgd2UndmUgc2VlbiBpdCBvbiBIUCBhbmQgTGVub3ZvCmxhcHRvcHMgYXMg
d2VsbCwgYW5kIEkndmUgaGVhcmQgYWJvdXQgdXNlcnMgaGF2aW5nIHRoZSBzYW1lIGlzc3VlcyBv
bgpBc3VzIGFuZCBNU0kgbGFwdG9wcyBhcyB3ZWxsLgoKSSB3aWxsIHNwZW5kIHNvbWUgdGltZSB0
byBjb2xsZWN0IGFsbCB0aGUgbmVjZXNzYXJ5IGluZm9ybWF0aW9uLApjcmVhdGUgYSBidWcgdG8g
cHV0IGl0IGFsbCBpbiB0aGVyZSBhbmQgc2VuZCBvdXQgYSB2NSB3aXRoIHRoZSB1cGRhdGVkCmlu
Zm9ybWF0aW9uIGFuZCByZWZlcmVuY2VzIHRvIHRoaXMgYnVnLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
