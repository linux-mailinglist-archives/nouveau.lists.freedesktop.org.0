Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F79DF055
	for <lists+nouveau@lfdr.de>; Mon, 21 Oct 2019 16:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15B08941D;
	Mon, 21 Oct 2019 14:49:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C11B6E135
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 14:49:22 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D94F2C049E1A
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 14:49:21 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id c32so11869331qtb.14
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 07:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qoM05916f2iOKQ8k9NQo94DTKSXVJOYaaX8pIUuRDvI=;
 b=k/tFY57ACmngqywDXYlUcTfmVkd1Fzv2A6BMS1dScrGGdys07xtgTVzk4LCqWI4Xxt
 JOBD8bc2V1YRoET+ZLD+MuLITP32UnoCksvZGvJc1W57H9Frs/GZZGep1Bwbi5WZisIS
 WyIw+9IK+y/NFGvS7RhX9VbI2YfQrbePlflD9YcFsoN4nT8Oko9hO5EUXihQk4IqdjAc
 JwA+MV2cPXGsL2eO+lqbhnOFvx/dcrcUdZxooZ6vwT5rIHLjTVcNAgcF+RL6o9j63iG6
 DjkUqWB+4OTY6Gi+MM4uX5fJphUqZGnYt9VDIj8s9g+rHENYjfqSOJ234Yv78r7ZAND7
 xmZg==
X-Gm-Message-State: APjAAAX70v4ILFRKq6kBaM1/13jItdr8TZit2R3muoYLSXh8c6az0Za8
 /OjCatRQbeprQACtzKU1P4Om97HvXPCvn/00ynYt+t+pov9NDnDR/OKBvPyo1DNfbD1KW9gCSeN
 kD6Ele+5JV8gfwFdn0DjUwk4E0uAtHhOcPeh//+gmCA==
X-Received: by 2002:a05:620a:a9c:: with SMTP id
 v28mr1773202qkg.381.1571669361068; 
 Mon, 21 Oct 2019 07:49:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxd+SAXdjO3y4S1oIDF06DXEmDuqtYz9U6zcL462CpXUBB9ua/mW5nvAsl4Exz5hHeQUwEuYJSw0QkJYkjPK+k=
X-Received: by 2002:a05:620a:a9c:: with SMTP id
 v28mr1773179qkg.381.1571669360782; 
 Mon, 21 Oct 2019 07:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com>
In-Reply-To: <20191021140852.GM2819@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 21 Oct 2019 16:49:09 +0200
Message-ID: <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [Nouveau] [PATCH v3] pci: prevent putting nvidia GPUs into
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgNDowOSBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDM6
NTQ6MDlQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiBJIHJlYWxseSB3b3VsZCBs
aWtlIHRvIHByb3ZpZGUgeW91IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgc3VjaAo+ID4gPiB3b3Jr
YXJvdW5kIGJ1dCBJJ20gbm90IGF3YXJlIG9mIGFueSA7LSkgSSBoYXZlIG5vdCBzZWVuIGFueSBp
c3N1ZXMgbGlrZQo+ID4gPiB0aGlzIHdoZW4gRDNjb2xkIGlzIHByb3Blcmx5IGltcGxlbWVudGVk
IGluIHRoZSBwbGF0Zm9ybS4gIFRoYXQncyB3aHkKPiA+ID4gSSdtIGJpdCBza2VwdGljYWwgdGhh
dCB0aGlzIGhhcyBhbnl0aGluZyB0byBkbyB3aXRoIHNwZWNpZmljIEludGVsIFBDSWUKPiA+ID4g
cG9ydHMuIE1vcmUgbGlrZWx5IGl0IGlzIHNvbWUgcG93ZXIgc2VxdWVuY2UgaW4gdGhlIF9PTi9f
T0ZGKCkgbWV0aG9kcwo+ID4gPiB0aGF0IGlzIHJ1biBkaWZmZXJlbnRseSBvbiBXaW5kb3dzLgo+
ID4KPiA+IHllYWguLiBtYXliZS4gSSByZWFsbHkgZG9uJ3Qga25vdyB3aGF0J3MgdGhlIGFjdHVh
bCByb290IGNhdXNlLiBJIGp1c3QKPiA+IGtub3cgdGhhdCB3aXRoIHRoaXMgd29ya2Fyb3VuZCBp
dCB3b3JrcyBwZXJmZWN0bHkgZmluZSBvbiBteSBhbmQgc29tZQo+ID4gb3RoZXIgc3lzdGVtcyBp
dCB3YXMgdGVzdGVkIG9uLiBEbyB5b3Uga25vdyB3aG8gd291bGQgYmUgYmVzdCB0bwo+ID4gYXBw
cm9hY2ggdG8gZ2V0IHByb3BlciBkb2N1bWVudGF0aW9uIGFib3V0IHRob3NlIG1ldGhvZHMgYW5k
IHdoYXQgYXJlCj4gPiB0aGUgYWN0dWFsIHByZXJlcXVpc2l0ZXMgb2YgdGhvc2UgbWV0aG9kcz8K
Pgo+IFRob3NlIHNob3VsZCBiZSBkb2N1bWVudGVkIGluIHRoZSBBQ1BJIHNwZWMuIENoYXB0ZXIg
NyBzaG91bGQgZXhwbGFpbgo+IHBvd2VyIHJlc291cmNlcyBhbmQgdGhlIGRldmljZSBwb3dlciBt
ZXRob2RzIGluIGRldGFpbC4KCmVpdGhlciBJIGxvb2tlZCB1cCB0aGUgd3Jvbmcgc3BlYyBvciB0
aGUgZG9jdW1lbnRhdGlvbiBpc24ndCByZWFsbHkKc2F5aW5nIG11Y2ggdGhlcmUuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
