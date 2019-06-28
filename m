Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A0E5A0C2
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 18:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E605B6E962;
	Fri, 28 Jun 2019 16:27:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7A06E962
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 16:27:55 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id s20so6567377otp.4
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1m5eUNW/8O3Uia+UgF1DOs7nZbA/5lPFN6ZbyXe0/Ls=;
 b=rEXgo/nTGJ2v+nSQ+6nEPL01/VRjC58nfehM8BYp6VQkGRQ1CWExRtFf/U0OHSlyIF
 Dr/A2AUnNMsRhK+0N0lNsq7NXijWV5O0Vczd5F3siG4Dzqz/J+x59bXccj56xbVpzKoW
 nCSAZSRMPjGNPExDevDdgAgPQIxxppi8BmQyuhgYyfO9KO7XD7XNvKQ9d79NYDvg/kRr
 kk4jI8sH55qzZ4EhBwy37O10QSQZtS8g3YPOjf4Ei0ecrr9QxYcz2VpKbR+iy/0AaKCI
 5xjzXp1tKR0uqvILAvd9LNS/xC/VXlHzkucLt7MJ6QGjh6oBOVXMDoPnzo79XcHTniqh
 Fzjg==
X-Gm-Message-State: APjAAAW3zOpeNntlYO6yDbm62IvcTmr22ri8HIlXve9mQRwRDFaIxm3V
 JWlbWwZ+dJLIG8BiX5RPQlIzWZbogWRjETO1q+ugrQ==
X-Google-Smtp-Source: APXvYqzpE+Kqyx1ivu95dqxD5Xmw+1dAtjgOIlYl2JIyAfPlIWR3aLAm88Jb4Ju/vM/swOByZ/3NEnMvyOQmHp503wY=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr9100984otk.363.1561739275009; 
 Fri, 28 Jun 2019 09:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
In-Reply-To: <20190628153827.GA5373@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 09:27:44 -0700
Message-ID: <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1m5eUNW/8O3Uia+UgF1DOs7nZbA/5lPFN6ZbyXe0/Ls=;
 b=cOaWk12t9PR+wM1gV05bVlfR0S1JSjfvb0hJ6JHo5ppfgDNgrz3BIflcx5b+w4agLb
 brYamehqIiFRGAjIKCUe6+Q53dn3hCuKVsdvquxg1/zCaxiJNgcnspoK9aZ9PKMXCUax
 piwsxxk5ZVG0/OrqNggRtsNENyTRYeAIsTv0w6rRIv8xEx0MB8nULTH+IB0NC3xJ3BeI
 w9h4nLRfPNokhqWP61aJrHtY0lfJBXalafI60Q5aBVAiBp99b8Xbt//EkmWeTAvVPTH8
 cyXy8F6iRDlqKv+0BbiPuN3y3R6N6GvMZWeSpv1agBiqh/rGomhhdkAUvQejKMcw69mS
 wn1A==
Subject: Re: [Nouveau] [PATCH 16/25] device-dax: use the dev_pagemap
 internal refcount
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgODozOSBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MTVQTSAr
MDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBUaGUgZnVuY3Rpb25hbGl0eSBpcyBp
ZGVudGljYWwgdG8gdGhlIG9uZSBjdXJyZW50bHkgb3BlbiBjb2RlZCBpbgo+ID4gZGV2aWNlLWRh
eC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
PiA+IFJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2RheC9kYXgtcHJpdmF0ZS5oIHwgIDQgLS0tLQo+ID4gIGRyaXZlcnMvZGF4
L2RldmljZS5jICAgICAgfCA0MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQo+Cj4gRGFuVzogSSB0aGlu
ayB0aGlzIHNlcmllcyBoYXMgcmVhY2hlZCBlbm91Z2ggcmV2aWV3LCBkaWQgeW91IHdhbnQKPiB0
byBhY2svdGVzdCBhbnkgZnVydGhlcj8KPgo+IFRoaXMgbmVlZHMgdG8gbGFuZCBpbiBobW0uZ2l0
IHNvb24gdG8gbWFrZSB0aGUgbWVyZ2Ugd2luZG93LgoKSSB3YXMgYXdhaXRpbmcgYSBkZWNpc2lv
biBhYm91dCByZXNvbHZpbmcgdGhlIGNvbGxpc2lvbiB3aXRoIElyYSdzCnBhdGNoIGJlZm9yZSB0
ZXN0aW5nIHRoZSBmaW5hbCByZXN1bHQgYWdhaW4gWzFdLiBZb3UgY2FuIGdvIGFoZWFkIGFuZAph
ZGQgbXkgcmV2aWV3ZWQtYnkgZm9yIHRoZSBzZXJpZXMsIGJ1dCBteSB0ZXN0ZWQtYnkgc2hvdWxk
IGJlIG9uIHRoZQpmaW5hbCBzdGF0ZSBvZiB0aGUgc2VyaWVzLgoKWzFdOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sL0NBUGN5djRnVE9mK0VXelNHckZyaDJHclRadDVIVlI9ZSt4aWNVS0Vw
aXk1N3B4OEord0BtYWlsLmdtYWlsLmNvbS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1
