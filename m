Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6234F8F
	for <lists+nouveau@lfdr.de>; Tue,  4 Jun 2019 20:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D129B89B38;
	Tue,  4 Jun 2019 18:07:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A13589B38
 for <nouveau@lists.freedesktop.org>; Tue,  4 Jun 2019 18:07:08 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z24so7727379qtj.10
 for <nouveau@lists.freedesktop.org>; Tue, 04 Jun 2019 11:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VqQq4cQNP39z5kvp6mgBtOtgAsl+vbQi/V8jvuLhzoY=;
 b=G1KkU73sHSPGg0/sEdS0YDBrBrbSDexkcm3I0pDgLugh0fqjaFRiOcr0CbZFL7LiIH
 CmuvQiH9jxWI764dT9XK6u0hDJVzQAe8nHPZDdvKCuEAA/p7mWBSzJhNVX6zTLh+oW2f
 FAqFPQIXTgDMJpuBknI7ntWv0QNC5pZDfyr7TLol2EH7E1LB6GABw6XcA5VDSStN8ji+
 bE5mdP3Uxp72pN9Kxo7O64vfL5yZ/W8WcaA8Hi6I/qNDIVOUTMIjQYjYSILtD4k5OgFz
 UBOXBQf6MoETyMy3WwAJ046VijhjsV8bmEKfFehUCUdnMZVOHVkJ5sg8+xfDzgWOn3q8
 9H2Q==
X-Gm-Message-State: APjAAAWYTJccXCnZXj8PVCg6flp+PmTVzf5jAxW0PJOdLp++Qvh6y8t8
 oRezC/xGezY+J4ulHcxWcYwFKw==
X-Google-Smtp-Source: APXvYqy+vc04jO68N2skYgAkUCBemyhBzD4nK6XLrxpDnp+XzXuRkXQj7D06MZEKj1rgjNFGd/ZNTQ==
X-Received: by 2002:aed:3a87:: with SMTP id o7mr29174051qte.310.1559671627398; 
 Tue, 04 Jun 2019 11:07:07 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id y8sm11947465qth.22.2019.06.04.11.07.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 04 Jun 2019 11:07:06 -0700 (PDT)
Message-ID: <ad520b3710906bfcf51d2f823db5cc99fb12ee90.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Rhys Kidd <rhyskidd@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Ilia
 Mirkin <imirkin@alum.mit.edu>
Date: Tue, 04 Jun 2019 14:07:05 -0400
In-Reply-To: <20190602141315.6197-1-rhyskidd@gmail.com>
References: <20190602141315.6197-1-rhyskidd@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 0/2] drm/nouveau/bios/init: Improve pre-PMU
 devinit opcode coverage
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rm9yIHRoZSB3aG9sZSBzZXJpZXM6CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KClRlc3RlZCBvbiBhIEdLMTA0IGFuZCBHSzExMCAoc2FtZSBvbmVzIGFzIG15IHZi
aW9zIHRyYWNlcyBpbiBvdXIgdmJpb3MgcmVwbykKCk9uIE1vbiwgMjAxOS0wNi0wMyBhdCAwMDox
MyArMTAwMCwgUmh5cyBLaWRkIHdyb3RlOgo+IE5WSURJQSBHUFVzIGluY2x1ZGUgYSBjb21tb24g
c2NyaXB0aW5nIGxhbmd1YWdlIChkZXZpbml0KSB0aGF0IGNhbiBiZQo+IGludGVycHJldGVkIGJ5
IGEgbnVtYmVyIG9mICJlbmdpbmVzIiwgZS5nLiB3aXRoaW4gYSBrZXJuZWwtbW9kZSBzb2Z0d2Fy
ZQo+IGRyaXZlciwgdGhlIFZHQSBCSU9TIG9yIGFuIG9uLWJvYXJkIHNtYWxsIG1pY3JvY29udHJv
bGxlciB3aGljaCBwcm92aWRlcwo+IGNlcnRhaW4gc2VjdXJpdHkgYXNzZXJ0aW9ucyAodGhlICdQ
TVUnKS4KPiAKPiBUaGlzIHN5c3RlbSBhbGxvd3MgYSBHUFUgcHJvZ3JhbW1pbmcgc2VxdWVuY2Ug
dG8gYmUgc2hhcmVkIGJ5IG11bHRpcGxlCj4gZW50aXRpZXMgdGhhdCB3b3VsZCBub3Qgb3RoZXJ3
aXNlIGJlIGFibGUgdG8gZXhlY3V0ZSBjb21tb24gY29kZS4KPiAKPiBUaGlzIHNlcmllcyBhZGRz
IHN1cHBvcnQgdG8gbm91dmVhdSBmb3IgdHdvIG9wY29kZXMgc2VlbiBvbiBWQklPU2VzIHByaW9y
Cj4gdG8gdGhlIGxvY2tlZC1kb3duIFBNVSB0YWtpbmcgb3ZlciByZXNwb25zaWJpbGl0eSBmb3Ig
ZXhlY3V0aW5nIGRldmluaXQKPiBzY3JpcHRzLgo+IAo+IERvY3VtZW50YXRpb24gZm9yIHRoZXNl
IHR3byBvcGNvZGVzIGNhbiBiZSBmb3VuZCBhdDoKPiAKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9l
bnZ5dG9vbHMvZW52eXRvb2xzL3B1bGwvMTg5Cj4gCj4gUmh5cyBLaWRkICgyKToKPiAgIGRybS9u
b3V2ZWF1L2Jpb3MvaW5pdDogaGFuZGxlIElOSVRfUkVTRVRfQkVHVU4gZGV2aW5pdCBvcGNvZGUK
PiAgIGRybS9ub3V2ZWF1L2Jpb3MvaW5pdDogaGFuZGxlIElOSVRfUkVTRVRfRU5EIGRldmluaXQg
b3Bjb2RlCj4gCj4gIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMg
ICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
