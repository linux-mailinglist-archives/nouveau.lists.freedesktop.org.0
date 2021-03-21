Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18223343558
	for <lists+nouveau@lfdr.de>; Sun, 21 Mar 2021 23:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F9889DEA;
	Sun, 21 Mar 2021 22:13:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE4589FDD;
 Sun, 21 Mar 2021 20:03:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id g25so8359886wmh.0;
 Sun, 21 Mar 2021 13:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mXGPduVgo7nKp2nyi0xELYmWlHdk6fvBtyodMz/5CwY=;
 b=Hw3vRTv2j5tEPuodZ1xAJB58RZ8IzuPFM9kAWf4ziS6Dr1LqFFkPE+hWbIWQERauDc
 q6rmi7SRGaYhloUlOLnPm78l13/zkUUv9Px6fOOWcX5UPYQ4tLQWXcrI8l7n5qS1w0zy
 /TZB+swkcT0rFvbKbUsjPQbdhZ+Z9MGvhENcO8RZJq89CQ0J35Gt+27nJxtXJUKlCik2
 OSbfm42szjGepM76sOFHzUAK2papKywIjsW3xfDjSvNiw15kJ09YIb454jFc1sO0JOfw
 9cD2QphwjBTzg+yTYDnga2f2BBFI0M35yudiFYJAeTAqSxRlkd1S43IgkZkq+Bd4xmPX
 f6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mXGPduVgo7nKp2nyi0xELYmWlHdk6fvBtyodMz/5CwY=;
 b=jVKewqf4/LEb6iG+Fioi+fisGruaun6H85glD8PH/S6FMRaQgsX56/dRQnku/0iFYs
 xJx/6Xrz/z0qEoy4JQib4YCRjpnyAEt3IpHXyVaZWdOVootq5qmgIAZs92fNvdDQlfz+
 j37DP1maFZXhoVnBo3s+ALoRNwwZQT+FbdXwnf2LPI7MiYSVtktLSDgGF70O5tIX+dGw
 E7VD6a2Rh01VtSz3xJ6L+GS6ooMuLXvP4Zzp8J5s6KDqtrBD1EH28g7PHe/fASJVrlwN
 Cet1AcI5gWf2/IrU9GYThpvFSaJ4OcqC9ECd3FAUp1kPHJx3TAI0JSwBJtoYzzgoFlu0
 pPaQ==
X-Gm-Message-State: AOAM533YnKNxmjJ3+gNI0yQKogZH6imA/+ylodbYMgeXa+FSo2wLsIVq
 v35NsaZG1MYo7ABe8NSJno0=
X-Google-Smtp-Source: ABdhPJyrpQ70EZBf/kOCKdK9JgCSOc6QcBumX8sX2z94YH0Eo8ZbY4oSYdYi15l6uNYCSZEXXkxCDA==
X-Received: by 2002:a1c:4145:: with SMTP id o66mr13275471wma.68.1616356984880; 
 Sun, 21 Mar 2021 13:03:04 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.83])
 by smtp.googlemail.com with ESMTPSA id n6sm20022114wrw.63.2021.03.21.13.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 13:03:04 -0700 (PDT)
To: Martin Peres <martin.peres@mupuf.org>, Lyude <lyude@redhat.com>,
 igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20210317224407.447572-1-lyude@redhat.com>
 <f5554f76-fc26-e307-0fe0-e59d3bca15ba@mupuf.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <3c1b6581-9b61-4e1a-56bd-95c8a2ec6472@gmail.com>
Date: Sun, 21 Mar 2021 22:02:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f5554f76-fc26-e307-0fe0-e59d3bca15ba@mupuf.org>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 21 Mar 2021 22:13:17 +0000
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] tests/kms_plane: Don't unset
 primary_fb when testing other planes
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gMTguMy4yMDIxIDguNDEsIE1hcnRpbiBQZXJlcyB3cm90ZToKPiBPbiAxOC8wMy8yMDIxIDAw
OjQ0LCBMeXVkZSB3cm90ZToKPj4gRnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
Pj4KPj4gQ3VycmVudGx5LCBub3V2ZWF1IGRvZXNuJ3Qgc3VwcG9ydCBoYXZpbmcgYSBDUlRDIHdp
dGhvdXQgYSBwcmltYXJ5IEZCIAo+PiBzZXQuIFdlCj4+IHdvbid0IHJlamVjdCBzdWNoIGNvbmZp
Z3VyYXRpb25zLCBidXQgdGhlIGJlaGF2aW9yIGlzIHVuZGVmaW5lZCB3aGljaCAKPj4gd2lsbCBj
YXVzZQo+PiBDUkNzIHRvIGJlY29tZSB1bmRlZmluZWQuIFNvLCBhdm9pZCBjbGVhcmluZyB0aGUg
cHJpbWFyeSBGQiB3aGlsZSAKPj4gd2UncmUgdGVzdGluZwo+PiBub24tcHJpbWFyeSBwbGFuZXMu
Cj4gCj4gTG9va3MgZ29vZCB0byBtZToKPiAKPiBSZXZpZXdlZC1ieTogTWFydGluIFBlcmVzIDxt
YXJ0aW4ucGVyZXNAbXVwdWYub3JnPgo+IAoKVGhpcyBkb2Vzbid0IGxvb2sgZ29vZCBhdCBhbGwu
IENvZGUgY2hhbmdlcyB3ZXJlIG5ldmVyIHJ1biBvbiBjaSwgc2VlIHRoaXM6Cmh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfNTYxNC9zaGFyZHMtYWxsLmh0bWw/
dGVzdGZpbHRlcj1rbXNfcGxhbmVAcGl4ZWwtZm9ybWF0CgpUaGlzIGhhcHBlbiBiZWNhdXNlIG9m
OgppZ3QtZ3B1LXRvb2xzJCBnaXQgYmxhbWUgdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LXByZS1t
ZXJnZS50eHQgLUwgMTczLCsxCjNlNjg2MDk4ZDkgKE1hcnRpbiBQZXJlcyAyMDIwLTAyLTIxIDEx
OjAwOjQ3ICswMjAwIDE3MykgCmlndEBrbXNfcGxhbmVAcGl4ZWwtZm9ybWF0LXBpcGUtW2EtZF0t
cGxhbmVzKC1zb3VyY2UtY2xhbXBpbmcpPwoKWW91J2xsIG5lZWQgdG8gaW5jbHVkZSBzb21ldGhp
bmcgbGlrZSB0aGlzIHRvIHRlc3QgYW5kIHJldmlldyB3aGF0IGRpZCAKY2hhbmdlIG9uIHBpeGVs
IGZvcm1hdCB0ZXN0czoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQw
NDcwNi8/c2VyaWVzPTg0MzcwJnJldj0xCgpidXQgYXMgdGhpcyBwYXRjaCBzZWVtcyB0byBiZSBh
bHJlYWR5IG1lcmdlZCBhcyB1bnRlc3RlZCB3ZSBub3cgaGF2ZSAKcGl4ZWwgZm9ybWF0IHRlc3Rz
IGZhaWxpbmcgcmVsaWFibHkgZXZlciBzaW5jZToKaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9pbmRleC5odG1sP3Rlc3RmaWx0ZXI9a21zX3BsYW5lQHBpeGVsLWZvcm1h
dCZob3N0cz10Z2wlN0NpY2wKCkkgaGF2ZSBvbmx5IGludGVsIGljbCBhdCBoYW5kIHNvIEkgaGF2
ZSBubyBzdWdnZXN0aW9ucyBmb3IgZml4LiBUaG91Z2gsIApsb29raW5nIGF0IHRob3NlIGZhaWx1
cmVzIFN0YW4gKENDZCkgbWF5IGhhdmUgc29tZSBpbnRlcmVzdCBvbiB0aGVtLgoKL0p1aGEtUGVr
a2EKCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4+
IENjOiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BmcmVlLmZyPgo+PiBDYzogQmVuIFNrZWdn
cyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+PiBDYzogSmVyZW15IENsaW5lIDxqY2xpbmVAcmVkaGF0
LmNvbT4KPj4gLS0tCj4+IMKgIHRlc3RzL2ttc19wbGFuZS5jIHwgOSArKysrKy0tLS0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMKPj4gaW5kZXgg
Mjk4YTkzNzUuLmM4Nzk4M2E0IDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9rbXNfcGxhbmUuYwo+PiAr
KysgYi90ZXN0cy9rbXNfcGxhbmUuYwo+PiBAQCAtODE3LDkgKzgxNywxMCBAQCBlbnVtIGNyY19z
ZXQgeyBQQUNLRURfQ1JDX1NFVCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1BWF9DUkNf
U0VUIH07Cj4+IMKgIHN0YXRpYyBib29sIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwg
ZW51bSBwaXBlIHBpcGUsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGln
dF9vdXRwdXRfdCAqb3V0cHV0LCBpZ3RfcGxhbmVfdCAqcGxhbmUpCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlndF9vdXRwdXRfdCAqb3V0cHV0LCBpZ3RfcGxhbmVfdCAq
cGxhbmUsIGlndF9mYl90IAo+PiAqcHJpbWFyeV9mYikKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0
cnVjdCBpZ3RfZmIgZmIgPSB7fTsKPj4gK8KgwqDCoCBzdHJ1Y3QgaWd0X2ZiICpjbGVhcl9mYiA9
IHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBFX1BSSU1BUlkgPyAKPj4gcHJpbWFyeV9mYiA6
IE5VTEw7Cj4+IMKgwqDCoMKgwqAgZHJtTW9kZU1vZGVJbmZvICptb2RlOwo+PiDCoMKgwqDCoMKg
IHVpbnQzMl90IGZvcm1hdCwgcmVmX2Zvcm1hdDsKPj4gwqDCoMKgwqDCoCB1aW50NjRfdCBtb2Rp
ZmllciwgcmVmX21vZGlmaWVyOwo+PiBAQCAtODc5LDcgKzg4MCw3IEBAIHN0YXRpYyBib29sIHRl
c3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51bSAKPj4gcGlwZSBwaXBlLAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZWlnaHQgPSB0ZXN0X2ZiLmhlaWdodDsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoMKgwqDCoMKgIGlndF9wbGFuZV9zZXRfZmIocGxhbmUs
IE5VTEwpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgY2xlYXJf
ZmIpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZ0
ZXN0X2ZiKTsKPj4gwqDCoMKgwqDCoCB9Cj4+IEBAIC05MzcsNyArOTM4LDcgQEAgc3RhdGljIGJv
b2wgdGVzdF9mb3JtYXRfcGxhbmUoZGF0YV90ICpkYXRhLCBlbnVtIAo+PiBwaXBlIHBpcGUsCj4+
IMKgwqDCoMKgwqAgaWd0X3BpcGVfY3JjX3N0b3AoZGF0YS0+cGlwZV9jcmMpOwo+PiAtwqDCoMKg
IGlndF9wbGFuZV9zZXRfZmIocGxhbmUsIE5VTEwpOwo+PiArwqDCoMKgIGlndF9wbGFuZV9zZXRf
ZmIocGxhbmUsIGNsZWFyX2ZiKTsKPj4gwqDCoMKgwqDCoCBpZ3RfcmVtb3ZlX2ZiKGRhdGEtPmRy
bV9mZCwgJmZiKTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcmVzdWx0Owo+PiBAQCAtMTAxMCw3ICsx
MDExLDcgQEAgdGVzdF9waXhlbF9mb3JtYXRzKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHBpcGUp
Cj4+IMKgwqDCoMKgwqAgZm9yX2VhY2hfcGxhbmVfb25fcGlwZSgmZGF0YS0+ZGlzcGxheSwgcGlw
ZSwgcGxhbmUpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChza2lwX3BsYW5lKGRhdGEsIHBs
YW5lKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+IC3CoMKgwqDC
oMKgwqDCoCByZXN1bHQgJj0gdGVzdF9mb3JtYXRfcGxhbmUoZGF0YSwgcGlwZSwgb3V0cHV0LCBw
bGFuZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXN1bHQgJj0gdGVzdF9mb3JtYXRfcGxhbmUoZGF0
YSwgcGlwZSwgb3V0cHV0LCBwbGFuZSwgCj4+ICZwcmltYXJ5X2ZiKTsKPj4gwqDCoMKgwqDCoCB9
Cj4+IMKgwqDCoMKgwqAgdGVzdF9maW5pKGRhdGEpOwo+Pgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
