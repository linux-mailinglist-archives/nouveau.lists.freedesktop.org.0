Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED027F159
	for <lists+nouveau@lfdr.de>; Wed, 30 Sep 2020 20:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DF66E055;
	Wed, 30 Sep 2020 18:32:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AFE6E055
 for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2020 18:32:25 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601490743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GHlBKQYnfqiWPdmIeH7NhRLeyxKC4d5e+gz9mvpgHio=;
 b=eXtPwsDZC8NV5te75dB1UVZ5UxgyusJt8wWgnkNVDLsLZ9yZ1UI2WEmQcopO6DJ2CPXyhc
 wUSHasvUq0kcDc0IQNVKL1yRWsrNCC9O9yEwXqJQ6mSr4dFLxSOTwnzzDarNAL7ThQWCqV
 vQZ2d8DBv7RNA1WP2uo9Tz34p/pr9vE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-88ivH61YMdu9OjKsPxdhbw-1; Wed, 30 Sep 2020 14:32:22 -0400
X-MC-Unique: 88ivH61YMdu9OjKsPxdhbw-1
Received: by mail-qv1-f72.google.com with SMTP id l1so1555012qvr.0
 for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2020 11:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GHlBKQYnfqiWPdmIeH7NhRLeyxKC4d5e+gz9mvpgHio=;
 b=BmSGnwfljOBx331Xe9BzD7828WbRwk7lJ0Oyki41KIwTGBGDRXoOfRIr4VGY4Vje7A
 fggCqdsVOB991w0wnODgBzWiBcpm+5IQCiSvQu+rTJ2qM7+NdJnz7FQ9QWNg0g/GUMQT
 QxGa61vwwJIx9KJXvEAAm7FYS4pg5wB2k9+uYtgyHls8M6ZcqeZpD7zFYoTWNJyRNbYU
 7vUOi+Tx9AunKYdCiIurqA4pq8+ztEZI+MD7U9vInc5c+SefrFBASEYJL18XHTEoxmQP
 mq7zlwIWgP7+0mi99LVzQyVrBkAHxwKfSQPp3fMlWu7FxR7CS1Knzf3KjufiiWutAKNs
 A/1Q==
X-Gm-Message-State: AOAM530Uhg1b0sLhC3KHF5+EIJlprpTAcsNqE93Ew9ubr2Sues+JkYto
 D1B3zBTYpYUsJN3t9akycpOOsAoLp6SB5NcgnF4rjDsW9lrCee5TgoaAs/zqk4OFkVb+u79AIbB
 nzPd1mFYJKBeATzivbUN7wQsrbg==
X-Received: by 2002:ac8:47cf:: with SMTP id d15mr3661759qtr.197.1601490741813; 
 Wed, 30 Sep 2020 11:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqev4BEl5fx/YfTuDvTzxh3INyNt1p0XAftlDqZ8jPR6q/JcIVavD0cCL2pt58C4IhZRn6pw==
X-Received: by 2002:ac8:47cf:: with SMTP id d15mr3661731qtr.197.1601490741433; 
 Wed, 30 Sep 2020 11:32:21 -0700 (PDT)
Received: from xps13 ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id w94sm3362778qte.93.2020.09.30.11.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 11:32:20 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:32:19 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20200930183219.GA518504@xps13>
References: <20200930173150.431995-1-lyude@redhat.com>
 <20200930173150.431995-6-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200930173150.431995-6-lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH i-g-t v5 5/5] tests: Add nouveau-crc tests
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDE6MzE6NTBQTSAtMDQwMCwgTHl1ZGUgd3JvdGU6Cj4g
RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAKPiBXZSdyZSBmaW5hbGx5IGdl
dHRpbmcgQ1JDIHN1cHBvcnQgaW4gbm91dmVhdSwgc28gbGV0J3Mgc3RhcnQgdGVzdGluZwo+IHRo
aXMgaW4gaWd0IGFzIHdlbGwhIFdoaWxlIHRoZSBub3JtYWwgQ1JDIGNhcHR1cmUgdGVzdHMgYXJl
IG5pY2UsCj4gdGhlcmUncyBhIG51bWJlciBvZiBOdmlkaWEtc3BlY2lmaWMgaGFyZHdhcmUgY2hh
cmFjdGVyaXN0aWNzIHRoYXQgd2UKPiBuZWVkIHRvIHRlc3QgYXMgd2VsbC4KPiAKPiBUaGUgbW9z
dCBpbXBvcnRhbnQgb25lIGlzIGtub3duIGFzIGEgIm5vdGlmaWVyIGNvbnRleHQgZmxpcCIuIEJh
c2ljYWxseSwKPiBOdmlkaWEgR1BVcyBzdG9yZSBnZW5lcmF0ZWQgQ1JDcyBpbiBhbiBhbGxvY2F0
ZWQgbWVtb3J5IHJlZ2lvbiwgcmVmZXJyZWQKPiB0byBhcyB0aGUgbm90aWZpZXIgY29udGV4dCwg
dGhhdCB0aGUgZHJpdmVyIHByb2dyYW1zIGl0c2VsZi4gU3RyYW5nZWx5LAo+IHRoaXMgcmVnaW9u
IGNhbiBvbmx5IGhvbGQgYSBsaW1pdGVkIG51bWJlciBvZiBDUkMgZW50cmllcywgYW5kIG9uY2Ug
aXQKPiBydW5zIG91dCBvZiBhdmFpbGFibGUgZW50cmllcyB0aGUgaGFyZHdhcmUgc2ltcGx5IHNl
dHMgYW4gb3ZlcnJ1biBiaXQKPiBhbmQgc3RvcHMgd3JpdGluZyBhbnkgbmV3IENSQyBlbnRyaWVz
Lgo+IAo+IFNpbmNlIGlndC1ncHUtdG9vbHMgZG9lc24ndCByZWFsbHkgaGF2ZSBhbiBleHBlY3Rh
dGlvbiBvZiBvbmx5IGJlaW5nCj4gYWJsZSB0byBncmFiIGEgbGltaXRlZCBudW1iZXIgb2YgQ1JD
cywgd2Ugd29yayBhcm91bmQgdGhpcyBpbiBub3V2ZWF1IGJ5Cj4gYWxsb2NhdGluZyB0d28gc2Vw
YXJhdGUgQ1JDIG5vdGlmaWVyIHJlZ2lvbnMgZWFjaCB0aW1lIHdlIHN0YXJ0Cj4gY2FwdHVyaW5n
IENSQ3MsIGFuZCB0aGVuIGZsaXAgYmV0d2VlbiB0aGVtIHdoZW5ldmVyIHdlIGdldCBjbG9zZSB0
bwo+IGZpbGxpbmcgb3VyIGN1cnJlbnRseSBwcm9ncmFtbWVkIG5vdGlmaWVyIGNvbnRleHQuIFdo
aWxlIHRoaXMga2VlcHMgdGhlCj4gbnVtYmVyIG9mIENSQyBlbnRyaWVzIHdlIGxvc2UgdG8gYW4g
YWJzb2x1dGUgbWluaW11bSwgd2UgYXJlIGd1YXJhbnRlZWQKPiB0byBsb3NlIGV4YWN0bHkgb25l
IENSQyBlbnRyeSBiZXR3ZWVuIGNvbnRleHQgZmxpcHMuIFRodXMsIHdlIGFkZCBzb21lCj4gdGVz
dHMgdG8gZW5zdXJlIHRoYXQgbm91dmVhdSBoYW5kbGVzIHRoZXNlIGZsaXBzIGNvcnJlY3RseQo+
IChwaXBlLVtBLUZdLWN0eC1mbGlwLWRldGVjdGlvbiksIGFuZCB0aGF0IGlndCBpdHNlbGYgaXMg
YWxzbyBhYmxlIHRvCj4gaGFuZGxlIHRoZW0gY29ycmVjdGx5IChwaXBlLVtBLUZdLWN0eC1mbGlw
LXNraXAtY3VycmVudC1mcmFtZSkuIFNpbmNlCj4gdGhlc2UgdGVzdHMgdXNlIGEgZGVidWdmcyBp
bnRlcmZhY2UgdG8gbWFudWFsbHkgY29udHJvbCB0aGUgbm90aWZpZXIKPiBjb250ZXh0IGZsaXAg
dGhyZXNob2xkLCB3ZSBhbHNvIGFkZCBvbmUgdGVzdCB0byBlbnN1cmUgdGhhdCBhbnkgZmxpcAo+
IHRocmVzaG9sZHMgd2Ugc2V0IGFyZSBjbGVhcmVkIGFmdGVyIGEgc2luZ2xlIENSQyBjYXB0dXJl
Cj4gKGN0eC1mbGlwLXRocmVzaG9sZC1yZXNldC1hZnRlci1jYXB0dXJlKS4KPiAKPiBJbiBhZGRp
dGlvbiwgd2UgYWxzbyBhZGQgc29tZSBzaW1wbGUgdGVzdHMgdG8gdGVzdCBOdmlkaWEtc3BlY2lm
aWMgQ1JDCj4gc291cmNlcy4KPiAKPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+ICogRG9uJ3QgY2xlYXIg
dGhlIGN1cnJlbnRseSBzZXQgZGlzcGxheSBwaXBlIGF0IHRoZSBlbmQgb2YgZWFjaCBpdGVyYXRp
b24gb2YKPiAgIHBpcGUgdGVzdHMsIG90aGVyd2lzZSB3ZSdsbCBhY2NpZGVudGFsbHkgbGVhdmUg
b3Vyc2VsdmVzIHdpdGggbm8gY29uZmlndXJlZAo+ICAgQ1JUQ3Mgd2hlbiB0aGUgdGVzdCBleGl0
cy4gSW5zdGVhZCBjbGVhciBpdCBhdCB0aGUgc3RhcnQgb2YgZWFjaCBpdGVyYXRpb24gb2YKPiAg
IHBpcGUgdGVzdHMgYnV0IG9ubHkgaWYgd2UganVzdCBmaW5pc2hlZCB0ZXN0aW5nIGEgZGlmZmVy
ZW50IHBpcGUuCj4gKiBHZXQgcmlkIG9mIG91dGRhdGVkIGNvbW1lbnQgYWJvdXQgdGVzdF9jdHhf
ZmxpcF9kZXRlY3Rpb24oKSBiZWluZyBsaW1pdGVkIHRvIGEKPiAgIHNpbmdsZSBwaXBlCj4gKiBD
bGFyaWZ5IGNvbW1lbnRzIGRlc2NyaWJpbmcgZ3VhcmRpbmcgYWdhaW5zdCBDUkMgY29sbGlzaW9u
cyBpbgo+ICAgdGVzdF9jdHhfZmxpcF9kZXRlY3Rpb24oKQo+ICogTWFrZSBhIHNtYWxsIGRvYyBi
bHVyYiBmb3IgdGVzdF9jdHhfZmxpcF9kZXRlY3Rpb24oKSwgaXQncyBhIHJhdGhlciB1bnVzdWFs
Cj4gICBhbmQgbnZpZGlhLXNwZWNpZmljIGJlaGF2aW9yCj4gKiBNZW50aW9uIGluIHRlc3RfY3R4
X2ZsaXBfZGV0ZWN0aW9uKCkgdGhhdCB3ZSBhbHNvIGV4cGxpY2l0bHkgY2hlY2sgdGhhdCB3ZSd2
ZQo+ICAgc2tpcHBlZCAtZXhhY3RseS0gb25lIGZyYW1lLiB0bDtkciBtb3JlIHRoZW4gb25lIGZy
YW1lIGlzIHRvbyBzbG93LCBsZXNzIHRoZW4KPiAgIG9uZSBmcmFtZSBtZWFucyBhIGNvbnRleHQg
ZmxpcCBqdXN0IGRpZG4ndCBoYXBwZW4gd2hlbiBpdCBzaG91bGQgaGF2ZS4KPiAqIEFsc28gY2hl
Y2sgdGhhdCB0aGUgZmxpcCB0aHJlc2hvbGQgd2Ugc2V0IGluCj4gICB0ZXN0X2N0eF9mbGlwX3Ro
cmVzaG9sZF9yZXNldF9hZnRlcl9jYXB0dXJlKCkgaXNuJ3QgaWdub3JlZCBieSB0aGUgZHJpdmVy
Cj4gKiBzLyhjcmVhdGV8ZGVzdHJveSlfY29sb3JzKCkvXDFfY3JjX2NvbG9ycy9nCj4gQ2hhbmdl
cyBzaW5jZSB2MzoKPiAqIFVwZGF0ZSAuZ2l0bGFiLWNpLnltbCB0byBtYWtlIG5vdXZlYXUgZXhl
bXB0IGZyb20gdGhlIHRlc3QtbGlzdC1kaWZmCj4gICB0ZXN0LCBzaW5jZSBhbGwgdGhlIGNvb2wg
a2lkcyBhcmUgZG9pbmcgaXQgYW5kIHdlIGRvbid0IGNhcmUgYWJvdXQKPiAgIGF1dG90b29scyBm
b3Igbm91dmVhdQo+IENoYW5nZXMgc2luY2UgdjI6Cj4gKiBGaXggbWlzc2luZyBpbmNsdWRlIGlu
IHRlc3RzL25vdXZlYXVfY3JjLmMsIHRoaXMgc2hvdWxkIGZpeCBidWlsZHMgZm9yCj4gICBhYXJj
aDY0Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAqIEZpeCBjb3B5cmlnaHQgeWVhciBpbiBub3V2ZWF1
X2NyYy5jCj4gCj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
PiAtLS0KPiAgLmdpdGxhYi1jaS55bWwgICAgICB8ICAgMiArLQo+ICBsaWIvZHJtdGVzdC5jICAg
ICAgIHwgIDEwICsrCj4gIGxpYi9kcm10ZXN0LmggICAgICAgfCAgIDIgKwo+ICB0ZXN0cy9tZXNv
bi5idWlsZCAgIHwgICAxICsKPiAgdGVzdHMvbm91dmVhdV9jcmMuYyB8IDQxNCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDQy
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0
cy9ub3V2ZWF1X2NyYy5jCj4gCj4gZGlmZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdpdGxh
Yi1jaS55bWwKPiBpbmRleCBkN2ZkYmZkZS4uZTIyNmQ5ZDcgMTAwNjQ0Cj4gLS0tIGEvLmdpdGxh
Yi1jaS55bWwKPiArKysgYi8uZ2l0bGFiLWNpLnltbAo+IEBAIC0yNDEsNyArMjQxLDcgQEAgdGVz
dDp0ZXN0LWxpc3QtZGlmZjoKPiAgICAgIC0gYnVpbGQ6dGVzdHMtZGViaWFuLWF1dG90b29scwo+
ICAgICAgLSBidWlsZDp0ZXN0cy1kZWJpYW4tbWVzb24KPiAgICBzdGFnZTogdGVzdAo+IC0gIHNj
cmlwdDogZGlmZiA8KHNlZCAicy8gL1xuL2ciIG1lc29uLXRlc3QtbGlzdC50eHR8IGdyZXAgLXYg
J3ZjNFx8djNkXHxwYW5mcm9zdCcgfCBzb3J0KSA8KHNlZCAicy8gL1xuL2ciIGF1dG90b29scy10
ZXN0LWxpc3QudHh0IHwgc29ydCkKPiArICBzY3JpcHQ6IGRpZmYgPChzZWQgInMvIC9cbi9nIiBt
ZXNvbi10ZXN0LWxpc3QudHh0fCBncmVwIC12ICd2YzRcfHYzZFx8cGFuZnJvc3RcfG5vdXZlYXUn
IHwgc29ydCkgPChzZWQgInMvIC9cbi9nIiBhdXRvdG9vbHMtdGVzdC1saXN0LnR4dCB8IHNvcnQp
Cj4gIAo+ICB0ZXN0Omxpc3QtdW5kb2N1bWVudGVkLXRlc3RzOgo+ICAgIGRlcGVuZGVuY2llczoK
PiBkaWZmIC0tZ2l0IGEvbGliL2RybXRlc3QuYyBiL2xpYi9kcm10ZXN0LmMKPiBpbmRleCBjNzMy
ZDFkZC4uNDQ3ZjU0MzUgMTAwNjQ0Cj4gLS0tIGEvbGliL2RybXRlc3QuYwo+ICsrKyBiL2xpYi9k
cm10ZXN0LmMKPiBAQCAtMTE0LDYgKzExNCwxMSBAQCBib29sIGlzX2k5MTVfZGV2aWNlKGludCBm
ZCkKPiAgCXJldHVybiBfX2lzX2RldmljZShmZCwgImk5MTUiKTsKPiAgfQo+ICAKPiArYm9vbCBp
c19ub3V2ZWF1X2RldmljZShpbnQgZmQpCj4gK3sKPiArCXJldHVybiBfX2lzX2RldmljZShmZCwg
Im5vdXZlYXUiKTsKPiArfQo+ICsKPiAgYm9vbCBpc192YzRfZGV2aWNlKGludCBmZCkKPiAgewo+
ICAJcmV0dXJuIF9faXNfZGV2aWNlKGZkLCAidmM0Iik7Cj4gQEAgLTYyMiw2ICs2MjcsMTEgQEAg
dm9pZCBpZ3RfcmVxdWlyZV9pbnRlbChpbnQgZmQpCj4gIAlpZ3RfcmVxdWlyZShpc19pOTE1X2Rl
dmljZShmZCkpOwo+ICB9Cj4gIAo+ICt2b2lkIGlndF9yZXF1aXJlX25vdXZlYXUoaW50IGZkKQo+
ICt7Cj4gKwlpZ3RfcmVxdWlyZShpc19ub3V2ZWF1X2RldmljZShmZCkpOwo+ICt9Cj4gKwo+ICB2
b2lkIGlndF9yZXF1aXJlX3ZjNChpbnQgZmQpCj4gIHsKPiAgCWlndF9yZXF1aXJlKGlzX3ZjNF9k
ZXZpY2UoZmQpKTsKPiBkaWZmIC0tZ2l0IGEvbGliL2RybXRlc3QuaCBiL2xpYi9kcm10ZXN0LmgK
PiBpbmRleCBjNTZiZmFmYS4uZGQ0Y2QzODQgMTAwNjQ0Cj4gLS0tIGEvbGliL2RybXRlc3QuaAo+
ICsrKyBiL2xpYi9kcm10ZXN0LmgKPiBAQCAtOTYsMTAgKzk2LDEyIEBAIGludCBfX2RybV9vcGVu
X2RyaXZlcl9yZW5kZXIoaW50IGNoaXBzZXQpOwo+ICAKPiAgdm9pZCBpZ3RfcmVxdWlyZV9hbWRn
cHUoaW50IGZkKTsKPiAgdm9pZCBpZ3RfcmVxdWlyZV9pbnRlbChpbnQgZmQpOwo+ICt2b2lkIGln
dF9yZXF1aXJlX25vdXZlYXUoaW50IGZkKTsKPiAgdm9pZCBpZ3RfcmVxdWlyZV92YzQoaW50IGZk
KTsKPiAgCj4gIGJvb2wgaXNfYW1kZ3B1X2RldmljZShpbnQgZmQpOwo+ICBib29sIGlzX2k5MTVf
ZGV2aWNlKGludCBmZCk7Cj4gK2Jvb2wgaXNfbm91dmVhdV9kZXZpY2UoaW50IGZkKTsKPiAgYm9v
bCBpc192YzRfZGV2aWNlKGludCBmZCk7Cj4gIAo+ICAvKioKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
bWVzb24uYnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZAo+IGluZGV4IDUxNWY3NTI4Li4zMmYwMTFl
OSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZAo+ICsrKyBiL3Rlc3RzL21lc29uLmJ1
aWxkCj4gQEAgLTc2LDYgKzc2LDcgQEAgdGVzdF9wcm9ncyA9IFsKPiAgCSdrbXNfdnJyJywKPiAg
CSdrbXNfd3JpdGViYWNrJywKPiAgCSdtZXRhX3Rlc3QnLAo+ICsJJ25vdXZlYXVfY3JjJywKPiAg
CSdwYW5mcm9zdF9nZXRfcGFyYW0nLAo+ICAJJ3BhbmZyb3N0X2dlbV9uZXcnLAo+ICAJJ3BhbmZy
b3N0X3ByaW1lJywKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvbm91dmVhdV9jcmMuYyBiL3Rlc3RzL25v
dXZlYXVfY3JjLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5mODcw
NWI1ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi90ZXN0cy9ub3V2ZWF1X2NyYy5jCj4gQEAgLTAs
MCArMSw0MTQgQEAKPiArLyoKPiArICogQ29weXJpZ2h0IMKpIDIwMjAgUmVkIEhhdCBJbmMuCj4g
KyAqCj4gKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0
byBhbnkgcGVyc29uIG9idGFpbmluZyBhCj4gKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCj4gKyAqIHRv
IGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRo
b3V0IGxpbWl0YXRpb24KPiArICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVy
Z2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCj4gKyAqIGFuZC9vciBzZWxsIGNv
cGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQo+
ICsgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zOgo+ICsgKgo+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBh
bmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSAoaW5jbHVkaW5nIHRoZSBuZXh0Cj4gKyAqIHBhcmFn
cmFwaCkgc2hhbGwgYmUgaW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0
aW9ucyBvZiB0aGUKPiArICogU29mdHdhcmUuCj4gKyAqCj4gKyAqIFRIRSBTT0ZUV0FSRSBJUyBQ
Uk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9S
Cj4gKyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJ
RVMgT0YgTUVSQ0hBTlRBQklMSVRZLAo+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwKPiArICogVEhFIEFV
VEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFH
RVMgT1IgT1RIRVIKPiArICogTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05U
UkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcKPiArICogRlJPTSwgT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5H
Uwo+ICsgKiBJTiBUSEUgU09GVFdBUkUuCj4gKyAqCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGZj
bnRsLmg+Cj4gKyNpbmNsdWRlICJpZ3QuaCIKPiArI2luY2x1ZGUgImlndF9zeXNmcy5oIgo+ICsK
PiArSUdUX1RFU1RfREVTQ1JJUFRJT04oCj4gKyJUZXN0cyBjZXJ0YWluIGFzcGVjdHMgb2YgQ1JD
IGNhcHR1cmUgdGhhdCBhcmUgZXhjbHVzaXZlIHRvIG52aWRpYSBoYXJkd2FyZSwgIgo+ICsic3Vj
aCBhcyBjb250ZXh0IGZsaXBwaW5nLiIpOwo+ICsKPiArdHlwZWRlZiBzdHJ1Y3Qgewo+ICsJaW50
IHBpcGU7Cj4gKwlpbnQgZHJtX2ZkOwo+ICsJaW50IG52X2NyY19kaXI7Cj4gKwlpZ3RfZGlzcGxh
eV90IGRpc3BsYXk7Cj4gKwlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsKPiArCWlndF9wbGFuZV90ICpw
cmltYXJ5Owo+ICsJZHJtTW9kZU1vZGVJbmZvICptb2RlOwo+ICsJaWd0X2ZiX3QgZGVmYXVsdF9m
YjsKPiArfSBkYXRhX3Q7Cj4gKwo+ICtzdHJ1Y3QgY29sb3JfZmIgewo+ICsJZG91YmxlIHIsIGcs
IGI7Cj4gKwlpZ3RfY3JjX3QgY3JjOwo+ICsJaWd0X2ZiX3QgZmI7Cj4gK307Cj4gKwo+ICsjZGVm
aW5lIEhFWF9DT0xPUihyXywgZ18sIGJfKSBcCj4gKwl7IC5yID0gKHJfIC8gMjU1LjApLCAuZyA9
IChnXyAvIDI1NS4wKSwgLmIgPSAoYl8gLyAyNTUuMCkgfQo+ICsKPiArc3RhdGljIHZvaWQgc2V0
X2NyY19mbGlwX3RocmVzaG9sZChkYXRhX3QgKmRhdGEsIHVuc2lnbmVkIGludCB0aHJlc2hvbGQp
Cj4gK3sKPiArCWlndF9kZWJ1ZygiU2V0dGluZyBDUkMgbm90aWZpZXIgZmxpcCB0aHJlc2hvbGQg
dG8gJWRcbiIsIHRocmVzaG9sZCk7Cj4gKwlpZ3RfYXNzZXJ0X2x0KDAsIGlndF9zeXNmc19wcmlu
dGYoZGF0YS0+bnZfY3JjX2RpciwgImZsaXBfdGhyZXNob2xkIiwgIiVkIiwgdGhyZXNob2xkKSk7
Cj4gK30KPiArCj4gKy8qIEluaXRpYWxpemUgZWFjaCBjb2xvcl9mYiBhbG9uZyB3aXRoIGl0cyBy
ZXNwZWN0aXZlIENSQyAqLwo+ICtzdGF0aWMgdm9pZCBjcmVhdGVfY3JjX2NvbG9ycyhkYXRhX3Qg
KmRhdGEsCj4gKwkJCSAgICAgIHN0cnVjdCBjb2xvcl9mYiAqY29sb3JzLAo+ICsJCQkgICAgICBz
aXplX3QgbGVuLAo+ICsJCQkgICAgICBpZ3RfcGlwZV9jcmNfdCAqcGlwZV9jcmMpCj4gK3sKPiAr
CWNoYXIgKmNyY19zdHI7Cj4gKwo+ICsJaWd0X3BpcGVfY3JjX3N0YXJ0KHBpcGVfY3JjKTsKPiAr
Cj4gKwlmb3IgKGludCBpID0gMDsgaSA8IGxlbjsgaSsrKSB7Cj4gKwkJaWd0X2NyZWF0ZV9jb2xv
cl9mYihkYXRhLT5kcm1fZmQsCj4gKwkJCQkgICAgZGF0YS0+bW9kZS0+aGRpc3BsYXksCj4gKwkJ
CQkgICAgZGF0YS0+bW9kZS0+dmRpc3BsYXksCj4gKwkJCQkgICAgRFJNX0ZPUk1BVF9YUkdCODg4
OCwKPiArCQkJCSAgICBMT0NBTF9EUk1fRk9STUFUX01PRF9OT05FLAo+ICsJCQkJICAgIGNvbG9y
c1tpXS5yLCBjb2xvcnNbaV0uZywgY29sb3JzW2ldLmIsCj4gKwkJCQkgICAgJmNvbG9yc1tpXS5m
Yik7Cj4gKwo+ICsJCWlndF9wbGFuZV9zZXRfZmIoZGF0YS0+cHJpbWFyeSwgJmNvbG9yc1tpXS5m
Yik7Cj4gKwkJaWd0X2Rpc3BsYXlfY29tbWl0KCZkYXRhLT5kaXNwbGF5KTsKPiArCQlpZ3RfcGlw
ZV9jcmNfZ2V0X2N1cnJlbnQoZGF0YS0+ZHJtX2ZkLCBwaXBlX2NyYywgJmNvbG9yc1tpXS5jcmMp
Owo+ICsKPiArCQljcmNfc3RyID0gaWd0X2NyY190b19zdHJpbmcoJmNvbG9yc1tpXS5jcmMpOwo+
ICsJCWlndF9kZWJ1ZygiQ1JDIGZvciBmcmFtZSAlZCBvZiBwYXR0ZXJuOiAlc1xuIiwKPiArCQkJ
ICBpLCBjcmNfc3RyKTsKPiArCQlmcmVlKGNyY19zdHIpOwo+ICsJfQo+ICsKPiArCWlndF9waXBl
X2NyY19zdG9wKHBpcGVfY3JjKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgZGVzdHJveV9jcmNf
Y29sb3JzKGRhdGFfdCAqZGF0YSwgc3RydWN0IGNvbG9yX2ZiICpjb2xvcnMsIHNpemVfdCBsZW4p
Cj4gK3sKPiArCS8qIFNvIHdlIGRvbid0IHR1cm4gb2ZmIHRoZSBwaXBlIGlmIHdlIHJlbW92ZSBp
dCdzIGN1cnJlbnQgZmIgKi8KPiArCWlndF9wbGFuZV9zZXRfZmIoZGF0YS0+cHJpbWFyeSwgJmRh
dGEtPmRlZmF1bHRfZmIpOwo+ICsKPiArCWZvciAoaW50IGkgPSAwOyBpIDwgbGVuOyBpKyspCj4g
KwkJaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZjb2xvcnNbaV0uZmIpOwo+ICt9Cj4gKwo+
ICsvKgo+ICsgKiBOdmlkaWEgR1BVcyBzdG9yZSBDUkNzIGluIGEgbGltaXRlZCBtZW1vcnkgdHJl
Z2lvbiBjYWxsZWQgdGhlIENSQyBub3RpZmllciBjb250ZXh0LiBXaGVuIHRoaXMKCnMvdHJlZ2lv
bi9yZWdpb24vLiBOb3Qgc3VyZSBpdCdzIHdvcnRoIHRoZSBlbWFpbCB0cmFmZmljIHJlcXVpcmVk
IHRvIGZpeAppdCwgdGhvdWdoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
