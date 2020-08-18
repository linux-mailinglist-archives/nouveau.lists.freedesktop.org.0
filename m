Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855EE248FD2
	for <lists+nouveau@lfdr.de>; Tue, 18 Aug 2020 23:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58CA6E14F;
	Tue, 18 Aug 2020 21:01:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7398F6E15F
 for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2020 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597784478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCWbaKa12ZjaVJABYRhP/TBbqvWsizR3JXDaVc/InGA=;
 b=Z+Ey5tJFB+33Z0B7lYXvWn/LvjAmawNtXhxxGB/kEhPkMD4lOrn6OMBJ8qVfAWpwgV7cxH
 OMwPeVHt3IgsY/6NrvoZ3+WXX5RweRzutyJ1unVSuO9LIGyLQZzNIBbqFhU3IY2mA3nK59
 XtG8JoWWXaIuAje0XxfSTKv4iQRinN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-yFdXAPg7P1i-1O_Ec-dSKg-1; Tue, 18 Aug 2020 17:01:11 -0400
X-MC-Unique: yFdXAPg7P1i-1O_Ec-dSKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 805E1D6382;
 Tue, 18 Aug 2020 21:01:10 +0000 (UTC)
Received: from Whitewolf.redhat.com (unknown [10.10.115.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12C261001281;
 Tue, 18 Aug 2020 21:01:10 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Aug 2020 17:00:51 -0400
Message-Id: <20200818210051.28705-1-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-6-lyude@redhat.com>
References: <20200417211025.109574-6-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v4] tests: Add nouveau-crc tests
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCldlJ3JlIGZpbmFsbHkgZ2V0dGlu
ZyBDUkMgc3VwcG9ydCBpbiBub3V2ZWF1LCBzbyBsZXQncyBzdGFydCB0ZXN0aW5nCnRoaXMgaW4g
aWd0IGFzIHdlbGwhIFdoaWxlIHRoZSBub3JtYWwgQ1JDIGNhcHR1cmUgdGVzdHMgYXJlIG5pY2Us
CnRoZXJlJ3MgYSBudW1iZXIgb2YgTnZpZGlhLXNwZWNpZmljIGhhcmR3YXJlIGNoYXJhY3Rlcmlz
dGljcyB0aGF0IHdlCm5lZWQgdG8gdGVzdCBhcyB3ZWxsLgoKVGhlIG1vc3QgaW1wb3J0YW50IG9u
ZSBpcyBrbm93biBhcyBhICJub3RpZmllciBjb250ZXh0IGZsaXAiLiBCYXNpY2FsbHksCk52aWRp
YSBHUFVzIHN0b3JlIGdlbmVyYXRlZCBDUkNzIGluIGFuIGFsbG9jYXRlZCBtZW1vcnkgcmVnaW9u
LCByZWZlcnJlZAp0byBhcyB0aGUgbm90aWZpZXIgY29udGV4dCwgdGhhdCB0aGUgZHJpdmVyIHBy
b2dyYW1zIGl0c2VsZi4gU3RyYW5nZWx5LAp0aGlzIHJlZ2lvbiBjYW4gb25seSBob2xkIGEgbGlt
aXRlZCBudW1iZXIgb2YgQ1JDIGVudHJpZXMsIGFuZCBvbmNlIGl0CnJ1bnMgb3V0IG9mIGF2YWls
YWJsZSBlbnRyaWVzIHRoZSBoYXJkd2FyZSBzaW1wbHkgc2V0cyBhbiBvdmVycnVuIGJpdAphbmQg
c3RvcHMgd3JpdGluZyBhbnkgbmV3IENSQyBlbnRyaWVzLgoKU2luY2UgaWd0LWdwdS10b29scyBk
b2Vzbid0IHJlYWxseSBoYXZlIGFuIGV4cGVjdGF0aW9uIG9mIG9ubHkgYmVpbmcKYWJsZSB0byBn
cmFiIGEgbGltaXRlZCBudW1iZXIgb2YgQ1JDcywgd2Ugd29yayBhcm91bmQgdGhpcyBpbiBub3V2
ZWF1IGJ5CmFsbG9jYXRpbmcgdHdvIHNlcGFyYXRlIENSQyBub3RpZmllciByZWdpb25zIGVhY2gg
dGltZSB3ZSBzdGFydApjYXB0dXJpbmcgQ1JDcywgYW5kIHRoZW4gZmxpcCBiZXR3ZWVuIHRoZW0g
d2hlbmV2ZXIgd2UgZ2V0IGNsb3NlIHRvCmZpbGxpbmcgb3VyIGN1cnJlbnRseSBwcm9ncmFtbWVk
IG5vdGlmaWVyIGNvbnRleHQuIFdoaWxlIHRoaXMga2VlcHMgdGhlCm51bWJlciBvZiBDUkMgZW50
cmllcyB3ZSBsb3NlIHRvIGFuIGFic29sdXRlIG1pbmltdW0sIHdlIGFyZSBndWFyYW50ZWVkCnRv
IGxvc2UgZXhhY3RseSBvbmUgQ1JDIGVudHJ5IGJldHdlZW4gY29udGV4dCBmbGlwcy4gVGh1cywg
d2UgYWRkIHNvbWUKdGVzdHMgdG8gZW5zdXJlIHRoYXQgbm91dmVhdSBoYW5kbGVzIHRoZXNlIGZs
aXBzIGNvcnJlY3RseQoocGlwZS1bQS1GXS1jdHgtZmxpcC1kZXRlY3Rpb24pLCBhbmQgdGhhdCBp
Z3QgaXRzZWxmIGlzIGFsc28gYWJsZSB0bwpoYW5kbGUgdGhlbSBjb3JyZWN0bHkgKHBpcGUtW0Et
Rl0tY3R4LWZsaXAtc2tpcC1jdXJyZW50LWZyYW1lKS4gU2luY2UKdGhlc2UgdGVzdHMgdXNlIGEg
ZGVidWdmcyBpbnRlcmZhY2UgdG8gbWFudWFsbHkgY29udHJvbCB0aGUgbm90aWZpZXIKY29udGV4
dCBmbGlwIHRocmVzaG9sZCwgd2UgYWxzbyBhZGQgb25lIHRlc3QgdG8gZW5zdXJlIHRoYXQgYW55
IGZsaXAKdGhyZXNob2xkcyB3ZSBzZXQgYXJlIGNsZWFyZWQgYWZ0ZXIgYSBzaW5nbGUgQ1JDIGNh
cHR1cmUKKGN0eC1mbGlwLXRocmVzaG9sZC1yZXNldC1hZnRlci1jYXB0dXJlKS4KCkluIGFkZGl0
aW9uLCB3ZSBhbHNvIGFkZCBzb21lIHNpbXBsZSB0ZXN0cyB0byB0ZXN0IE52aWRpYS1zcGVjaWZp
YyBDUkMKc291cmNlcy4KCkNoYW5nZXMgc2luY2UgdjM6CiogVXBkYXRlIC5naXRsYWItY2kueW1s
IHRvIG1ha2Ugbm91dmVhdSBleGVtcHQgZnJvbSB0aGUgdGVzdC1saXN0LWRpZmYKICB0ZXN0LCBz
aW5jZSBhbGwgdGhlIGNvb2wga2lkcyBhcmUgZG9pbmcgaXQgYW5kIHdlIGRvbid0IGNhcmUgYWJv
dXQKICBhdXRvdG9vbHMgZm9yIG5vdXZlYXUKQ2hhbmdlcyBzaW5jZSB2MjoKKiBGaXggbWlzc2lu
ZyBpbmNsdWRlIGluIHRlc3RzL25vdXZlYXVfY3JjLmMsIHRoaXMgc2hvdWxkIGZpeCBidWlsZHMg
Zm9yCiAgYWFyY2g2NApDaGFuZ2VzIHNpbmNlIHYxOgoqIEZpeCBjb3B5cmlnaHQgeWVhciBpbiBu
b3V2ZWF1X2NyYy5jCgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PgotLS0KIC5naXRsYWItY2kueW1sICAgICAgfCAgIDIgKy0KIGxpYi9kcm10ZXN0LmMgICAgICAg
fCAgMTAgKysKIGxpYi9kcm10ZXN0LmggICAgICAgfCAgIDIgKwogdGVzdHMvbWVzb24uYnVpbGQg
ICB8ICAgMSArCiB0ZXN0cy9ub3V2ZWF1X2NyYy5jIHwgMzk3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDQxMSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvbm91dmVhdV9jcmMu
YwoKZGlmZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdpdGxhYi1jaS55bWwKaW5kZXggZDdm
ZGJmZGUuLmUyMjZkOWQ3IDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFi
LWNpLnltbApAQCAtMjQxLDcgKzI0MSw3IEBAIHRlc3Q6dGVzdC1saXN0LWRpZmY6CiAgICAgLSBi
dWlsZDp0ZXN0cy1kZWJpYW4tYXV0b3Rvb2xzCiAgICAgLSBidWlsZDp0ZXN0cy1kZWJpYW4tbWVz
b24KICAgc3RhZ2U6IHRlc3QKLSAgc2NyaXB0OiBkaWZmIDwoc2VkICJzLyAvXG4vZyIgbWVzb24t
dGVzdC1saXN0LnR4dHwgZ3JlcCAtdiAndmM0XHx2M2RcfHBhbmZyb3N0JyB8IHNvcnQpIDwoc2Vk
ICJzLyAvXG4vZyIgYXV0b3Rvb2xzLXRlc3QtbGlzdC50eHQgfCBzb3J0KQorICBzY3JpcHQ6IGRp
ZmYgPChzZWQgInMvIC9cbi9nIiBtZXNvbi10ZXN0LWxpc3QudHh0fCBncmVwIC12ICd2YzRcfHYz
ZFx8cGFuZnJvc3RcfG5vdXZlYXUnIHwgc29ydCkgPChzZWQgInMvIC9cbi9nIiBhdXRvdG9vbHMt
dGVzdC1saXN0LnR4dCB8IHNvcnQpCiAKIHRlc3Q6bGlzdC11bmRvY3VtZW50ZWQtdGVzdHM6CiAg
IGRlcGVuZGVuY2llczoKZGlmZiAtLWdpdCBhL2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5j
CmluZGV4IGM3MzJkMWRkLi40NDdmNTQzNSAxMDA2NDQKLS0tIGEvbGliL2RybXRlc3QuYworKysg
Yi9saWIvZHJtdGVzdC5jCkBAIC0xMTQsNiArMTE0LDExIEBAIGJvb2wgaXNfaTkxNV9kZXZpY2Uo
aW50IGZkKQogCXJldHVybiBfX2lzX2RldmljZShmZCwgImk5MTUiKTsKIH0KIAorYm9vbCBpc19u
b3V2ZWF1X2RldmljZShpbnQgZmQpCit7CisJcmV0dXJuIF9faXNfZGV2aWNlKGZkLCAibm91dmVh
dSIpOworfQorCiBib29sIGlzX3ZjNF9kZXZpY2UoaW50IGZkKQogewogCXJldHVybiBfX2lzX2Rl
dmljZShmZCwgInZjNCIpOwpAQCAtNjIyLDYgKzYyNywxMSBAQCB2b2lkIGlndF9yZXF1aXJlX2lu
dGVsKGludCBmZCkKIAlpZ3RfcmVxdWlyZShpc19pOTE1X2RldmljZShmZCkpOwogfQogCit2b2lk
IGlndF9yZXF1aXJlX25vdXZlYXUoaW50IGZkKQoreworCWlndF9yZXF1aXJlKGlzX25vdXZlYXVf
ZGV2aWNlKGZkKSk7Cit9CisKIHZvaWQgaWd0X3JlcXVpcmVfdmM0KGludCBmZCkKIHsKIAlpZ3Rf
cmVxdWlyZShpc192YzRfZGV2aWNlKGZkKSk7CmRpZmYgLS1naXQgYS9saWIvZHJtdGVzdC5oIGIv
bGliL2RybXRlc3QuaAppbmRleCBjNTZiZmFmYS4uZGQ0Y2QzODQgMTAwNjQ0Ci0tLSBhL2xpYi9k
cm10ZXN0LmgKKysrIGIvbGliL2RybXRlc3QuaApAQCAtOTYsMTAgKzk2LDEyIEBAIGludCBfX2Ry
bV9vcGVuX2RyaXZlcl9yZW5kZXIoaW50IGNoaXBzZXQpOwogCiB2b2lkIGlndF9yZXF1aXJlX2Ft
ZGdwdShpbnQgZmQpOwogdm9pZCBpZ3RfcmVxdWlyZV9pbnRlbChpbnQgZmQpOwordm9pZCBpZ3Rf
cmVxdWlyZV9ub3V2ZWF1KGludCBmZCk7CiB2b2lkIGlndF9yZXF1aXJlX3ZjNChpbnQgZmQpOwog
CiBib29sIGlzX2FtZGdwdV9kZXZpY2UoaW50IGZkKTsKIGJvb2wgaXNfaTkxNV9kZXZpY2UoaW50
IGZkKTsKK2Jvb2wgaXNfbm91dmVhdV9kZXZpY2UoaW50IGZkKTsKIGJvb2wgaXNfdmM0X2Rldmlj
ZShpbnQgZmQpOwogCiAvKioKZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMv
bWVzb24uYnVpbGQKaW5kZXggNjg0ZGUwNDMuLjkyNjQ3OTkxIDEwMDY0NAotLS0gYS90ZXN0cy9t
ZXNvbi5idWlsZAorKysgYi90ZXN0cy9tZXNvbi5idWlsZApAQCAtNzQsNiArNzQsNyBAQCB0ZXN0
X3Byb2dzID0gWwogCSdrbXNfdmJsYW5rJywKIAkna21zX3ZycicsCiAJJ21ldGFfdGVzdCcsCisJ
J25vdXZlYXVfY3JjJywKIAkncGFuZnJvc3RfZ2V0X3BhcmFtJywKIAkncGFuZnJvc3RfZ2VtX25l
dycsCiAJJ3BhbmZyb3N0X3ByaW1lJywKZGlmZiAtLWdpdCBhL3Rlc3RzL25vdXZlYXVfY3JjLmMg
Yi90ZXN0cy9ub3V2ZWF1X2NyYy5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
Li4wNWMyZjRkZQotLS0gL2Rldi9udWxsCisrKyBiL3Rlc3RzL25vdXZlYXVfY3JjLmMKQEAgLTAs
MCArMSwzOTcgQEAKKy8qCisgKiBDb3B5cmlnaHQgwqkgMjAyMCBSZWQgSGF0IEluYy4KKyAqCisg
KiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBl
cnNvbiBvYnRhaW5pbmcgYQorICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVk
IGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyAqIHRvIGRlYWwgaW4gdGhl
IFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRp
b24KKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBk
aXN0cmlidXRlLCBzdWJsaWNlbnNlLAorICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0
d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCisgKiBTb2Z0d2FyZSBpcyBm
dXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgor
ICoKKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90
aWNlIChpbmNsdWRpbmcgdGhlIG5leHQKKyAqIHBhcmFncmFwaCkgc2hhbGwgYmUgaW5jbHVkZWQg
aW4gYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUKKyAqIFNvZnR3YXJl
LgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJB
TlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5P
VCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyAqIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBF
VkVOVCBTSEFMTAorICogVEhFIEFVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxF
IEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKKyAqIExJQUJJTElUWSwgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HCisgKiBG
Uk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNF
IE9SIE9USEVSIERFQUxJTkdTCisgKiBJTiBUSEUgU09GVFdBUkUuCisgKgorICovCisKKyNpbmNs
dWRlIDxmY250bC5oPgorI2luY2x1ZGUgImlndC5oIgorI2luY2x1ZGUgImlndF9zeXNmcy5oIgor
CitJR1RfVEVTVF9ERVNDUklQVElPTigKKyJUZXN0cyBjZXJ0YWluIGFzcGVjdHMgb2YgQ1JDIGNh
cHR1cmUgdGhhdCBhcmUgZXhjbHVzaXZlIHRvIG52aWRpYSBoYXJkd2FyZSwgIgorInN1Y2ggYXMg
Y29udGV4dCBmbGlwcGluZy4iKTsKKwordHlwZWRlZiBzdHJ1Y3QgeworCWludCBwaXBlOworCWlu
dCBkcm1fZmQ7CisJaW50IG52X2NyY19kaXI7CisJaWd0X2Rpc3BsYXlfdCBkaXNwbGF5OworCWln
dF9vdXRwdXRfdCAqb3V0cHV0OworCWlndF9wbGFuZV90ICpwcmltYXJ5OworCWRybU1vZGVNb2Rl
SW5mbyAqbW9kZTsKKwlpZ3RfZmJfdCBkZWZhdWx0X2ZiOworfSBkYXRhX3Q7CisKK3N0cnVjdCBj
b2xvcl9mYiB7CisJZG91YmxlIHIsIGcsIGI7CisJaWd0X2NyY190IGNyYzsKKwlpZ3RfZmJfdCBm
YjsKK307CisKKyNkZWZpbmUgSEVYX0NPTE9SKHJfLCBnXywgYl8pIFwKKwl7IC5yID0gKHJfIC8g
MjU1LjApLCAuZyA9IChnXyAvIDI1NS4wKSwgLmIgPSAoYl8gLyAyNTUuMCkgfQorCitzdGF0aWMg
dm9pZCBzZXRfY3JjX2ZsaXBfdGhyZXNob2xkKGRhdGFfdCAqZGF0YSwgdW5zaWduZWQgaW50IHRo
cmVzaG9sZCkKK3sKKwlpZ3RfZGVidWcoIlNldHRpbmcgQ1JDIG5vdGlmaWVyIGZsaXAgdGhyZXNo
b2xkIHRvICVkXG4iLCB0aHJlc2hvbGQpOworCWlndF9hc3NlcnRfbHQoMCwgaWd0X3N5c2ZzX3By
aW50ZihkYXRhLT5udl9jcmNfZGlyLCAiZmxpcF90aHJlc2hvbGQiLCAiJWQiLCB0aHJlc2hvbGQp
KTsKK30KKworc3RhdGljIHZvaWQgY3JlYXRlX2NvbG9ycyhkYXRhX3QgKmRhdGEsCisJCQkgIHN0
cnVjdCBjb2xvcl9mYiAqY29sb3JzLAorCQkJICBzaXplX3QgbGVuLAorCQkJICBpZ3RfcGlwZV9j
cmNfdCAqcGlwZV9jcmMpCit7CisJY2hhciAqY3JjX3N0cjsKKworCWlndF9waXBlX2NyY19zdGFy
dChwaXBlX2NyYyk7CisKKwlmb3IgKGludCBpID0gMDsgaSA8IGxlbjsgaSsrKSB7CisJCWlndF9j
cmVhdGVfY29sb3JfZmIoZGF0YS0+ZHJtX2ZkLAorCQkJCSAgICBkYXRhLT5tb2RlLT5oZGlzcGxh
eSwKKwkJCQkgICAgZGF0YS0+bW9kZS0+dmRpc3BsYXksCisJCQkJICAgIERSTV9GT1JNQVRfWFJH
Qjg4ODgsCisJCQkJICAgIExPQ0FMX0RSTV9GT1JNQVRfTU9EX05PTkUsCisJCQkJICAgIGNvbG9y
c1tpXS5yLCBjb2xvcnNbaV0uZywgY29sb3JzW2ldLmIsCisJCQkJICAgICZjb2xvcnNbaV0uZmIp
OworCisJCWlndF9wbGFuZV9zZXRfZmIoZGF0YS0+cHJpbWFyeSwgJmNvbG9yc1tpXS5mYik7CisJ
CWlndF9kaXNwbGF5X2NvbW1pdCgmZGF0YS0+ZGlzcGxheSk7CisJCWlndF9waXBlX2NyY19nZXRf
Y3VycmVudChkYXRhLT5kcm1fZmQsIHBpcGVfY3JjLCAmY29sb3JzW2ldLmNyYyk7CisKKwkJY3Jj
X3N0ciA9IGlndF9jcmNfdG9fc3RyaW5nKCZjb2xvcnNbaV0uY3JjKTsKKwkJaWd0X2RlYnVnKCJD
UkMgZm9yIGZyYW1lICVkIG9mIHBhdHRlcm46ICVzXG4iLAorCQkJICBpLCBjcmNfc3RyKTsKKwkJ
ZnJlZShjcmNfc3RyKTsKKwl9CisKKwlpZ3RfcGlwZV9jcmNfc3RvcChwaXBlX2NyYyk7Cit9CisK
K3N0YXRpYyB2b2lkIGRlc3Ryb3lfY29sb3JzKGRhdGFfdCAqZGF0YSwgc3RydWN0IGNvbG9yX2Zi
ICpjb2xvcnMsIHNpemVfdCBsZW4pCit7CisJLyogU28gd2UgZG9uJ3QgdHVybiBvZmYgdGhlIHBp
cGUgaWYgd2UgcmVtb3ZlIGl0J3MgY3VycmVudCBmYiAqLworCWlndF9wbGFuZV9zZXRfZmIoZGF0
YS0+cHJpbWFyeSwgJmRhdGEtPmRlZmF1bHRfZmIpOworCisJZm9yIChpbnQgaSA9IDA7IGkgPCBs
ZW47IGkrKykKKwkJaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZjb2xvcnNbaV0uZmIpOwor
fQorCisvKiBIYXJkLWNvZGVkIHRvIFBJUEVfQSBmb3Igbm93LCB3ZSBkb24ndCByZWFsbHkgbmVl
ZCB0byB0ZXN0IHRoaXMgb24gbW9yZSB0aGVuCisgKiBvbmUgaGVhZAorICovCitzdGF0aWMgdm9p
ZCB0ZXN0X2N0eF9mbGlwX2RldGVjdGlvbihkYXRhX3QgKmRhdGEpCit7CisJc3RydWN0IGNvbG9y
X2ZiIGNvbG9yc1tdID0geworCQlIRVhfQ09MT1IoMHhGRiwgMHgwMCwgMHgxOCksCisJCUhFWF9D
T0xPUigweEZGLCAweEE1LCAweDJDKSwKKwkJSEVYX0NPTE9SKDB4RkYsIDB4RkYsIDB4NDEpLAor
CQlIRVhfQ09MT1IoMHgwMCwgMHg4MCwgMHgxOCksCisJCUhFWF9DT0xPUigweDAwLCAweDAwLCAw
eEY5KSwKKwkJSEVYX0NPTE9SKDB4ODYsIDB4MDAsIDB4N0QpLAorCX07CisJaWd0X291dHB1dF90
ICpvdXRwdXQgPSBkYXRhLT5vdXRwdXQ7CisJaWd0X3BsYW5lX3QgKnByaW1hcnkgPSBkYXRhLT5w
cmltYXJ5OworCWlndF9waXBlX2NyY190ICpwaXBlX2NyYzsKKwljb25zdCBpbnQgbl9jb2xvcnMg
PSBBUlJBWV9TSVpFKGNvbG9ycyk7CisJY29uc3QgaW50IG5fY3JjcyA9IDIwOworCWlndF9jcmNf
dCAqY3JjcyA9IE5VTEw7CisJaW50IHN0YXJ0ID0gLTEsIGZyYW1lLCBzdGFydF9jb2xvciA9IC0x
LCBpOworCWJvb2wgZm91bmRfc2tpcCA9IGZhbHNlOworCisJcGlwZV9jcmMgPSBpZ3RfcGlwZV9j
cmNfbmV3KGRhdGEtPmRybV9mZCwgZGF0YS0+cGlwZSwgImF1dG8iKTsKKworCWNyZWF0ZV9jb2xv
cnMoZGF0YSwgY29sb3JzLCBuX2NvbG9ycywgcGlwZV9jcmMpOworCisJc2V0X2NyY19mbGlwX3Ro
cmVzaG9sZChkYXRhLCBuX2NyY3MgLyAyKTsKKwlpZ3RfcGlwZV9jcmNfc3RhcnQocGlwZV9jcmMp
OworCisJZm9yIChpID0gMDsgaSA8IG5fY3JjczsgaSsrKSB7CisJCWNvbnN0IGludCBjb2xvcl9p
ZHggPSBpICUgbl9jb2xvcnM7CisKKwkJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmY29sb3Jz
W2NvbG9yX2lkeF0uZmIpOworCQlkb19vcl9kaWUoZHJtTW9kZVBhZ2VGbGlwKGRhdGEtPmRybV9m
ZCwKKwkJCQkJICBvdXRwdXQtPmNvbmZpZy5jcnRjLT5jcnRjX2lkLAorCQkJCQkgIGNvbG9yc1tj
b2xvcl9pZHhdLmZiLmZiX2lkLAorCQkJCQkgIERSTV9NT0RFX1BBR0VfRkxJUF9FVkVOVCwKKwkJ
CQkJICBOVUxMKSk7CisJCWttc3Rlc3Rfd2FpdF9mb3JfcGFnZWZsaXAoZGF0YS0+ZHJtX2ZkKTsK
Kwl9CisKKwlpZ3RfcGlwZV9jcmNfZ2V0X2NyY3MocGlwZV9jcmMsIG5fY3JjcywgJmNyY3MpOwor
CWlndF9waXBlX2NyY19zdG9wKHBpcGVfY3JjKTsKKworCS8qCisJICogRmluZCB0aGUgZmlyc3Qg
Y29sb3IgaW4gb3VyIHBhdHRlcm4gd2l0aCBhIENSQyB0aGF0IGRpZmZlcnMgZnJvbSB0aGUKKwkg
KiBsYXN0IENSQywgc28gd2UgY2FuIHVzZSBpdCB0byBmaW5kIHRoZSBzdGFydCBvZiB0aGUgcGF0
dGVybgorCSAqLworCWZvciAoaSA9IDA7IGkgPCBuX2NvbG9ycyAtIDE7IGkrKykgeworCQlpZiAo
aWd0X2NoZWNrX2NyY19lcXVhbCgmY29sb3JzW2ldLmNyYywgJmNvbG9yc1tuX2NvbG9ycyAtIDFd
LmNyYykpCisJCQljb250aW51ZTsKKworCQlpZ3RfZGVidWcoIlVzaW5nIGZyYW1lICVkIG9mIHBh
dHRlcm4gZm9yIGZpbmRpbmcgc3RhcnRcbiIsIGkpOworCQlzdGFydF9jb2xvciA9IGk7CisJCWJy
ZWFrOworCX0KKwlpZ3RfYXNzZXJ0X2x0ZSgwLCBzdGFydF9jb2xvcik7CisKKwkvKiBOb3csIGZp
Z3VyZSBvdXQgd2hlcmUgdGhlIHBhdHRlcm4gc3RhcnRzICovCisJZm9yIChpID0gMDsgaSA8IG5f
Y3JjczsgaSsrKSB7CisJCWlmICghaWd0X2NoZWNrX2NyY19lcXVhbCgmY29sb3JzW3N0YXJ0X2Nv
bG9yXS5jcmMsICZjcmNzW2ldKSkKKwkJCWNvbnRpbnVlOworCisJCXN0YXJ0ID0gaSAtIHN0YXJ0
X2NvbG9yOworCQlmcmFtZSA9IGNyY3NbaV0uZnJhbWU7CisJCWlndF9kZWJ1ZygiUGF0dGVybiBz
dGFydGVkIG9uIGZyYW1lICVkXG4iLCBmcmFtZSk7CisJCWJyZWFrOworCX0KKwlpZ3RfYXNzZXJ0
X2x0ZSgwLCBzdGFydCk7CisKKwkvKiBBbmQgZmluYWxseSwgYXNzZXJ0IHRoYXQgYWNjb3JkaW5n
IHRvIHRoZSBDUkNzIGV4YWN0bHkgYWxsIGJ1dCBvbmUKKwkgKiBmcmFtZSB3YXMgZGlzcGxheWVk
IGluIG9yZGVyLiBUaGUgbWlzc2luZyBmcmFtZSBjb21lcyBmcm9tCisJICogKGluZXZpdGFibHkp
IGxvc2luZyBhIHNpbmdsZSBDUkMgZXZlbnQgd2hlbiBub3V2ZWF1IHN3aXRjaGVzIG5vdGlmaWVy
CisJICogY29udGV4dHMKKwkgKi8KKwlmb3IgKGkgPSBzdGFydDsgaSA8IG5fY3JjczsgaSsrLCBm
cmFtZSsrKSB7CisJCWlndF9jcmNfdCAqY3JjID0gJmNyY3NbaV07CisJCWNoYXIgKmNyY19zdHI7
CisJCWludCBjb2xvcl9pZHg7CisKKwkJY3JjX3N0ciA9IGlndF9jcmNfdG9fc3RyaW5nKGNyYyk7
CisJCWlndF9kZWJ1ZygiQ1JDICVkOiB2Ymw9JWQgdmFsPSVzXG4iLCBpLCBjcmMtPmZyYW1lLCBj
cmNfc3RyKTsKKwkJZnJlZShjcmNfc3RyKTsKKworCQlpZiAoIWZvdW5kX3NraXAgJiYgY3JjLT5m
cmFtZSAhPSBmcmFtZSkgeworCQkJaWd0X2RlYnVnKCJeXl4gRm91bmQgZXhwZWN0ZWQgc2tpcHBl
ZCBDUkMgJWQgXl5eXG4iLAorCQkJCSAgY3JjLT5mcmFtZSAtIDEpOworCQkJZm91bmRfc2tpcCA9
IHRydWU7CisJCQlmcmFtZSsrOworCQl9CisKKwkJLyogV2Ugc2hvdWxkIG5ldmVyIHNraXAgbW9y
ZSB0aGVuIG9uZSBmcmFtZSAqLworCQlpZiAoZm91bmRfc2tpcCkgeworCQkJaWd0X2Fzc2VydF9l
cShjcmMtPmZyYW1lLCBmcmFtZSk7CisJCQljb2xvcl9pZHggPSAoaSAtIHN0YXJ0ICsgMSkgJSBu
X2NvbG9yczsKKwkJfSBlbHNlIHsKKwkJCWNvbG9yX2lkeCA9IChpIC0gc3RhcnQpICUgbl9jb2xv
cnM7CisJCX0KKworCQlpZ3RfYXNzZXJ0X2NyY19lcXVhbChjcmMsICZjb2xvcnNbY29sb3JfaWR4
XS5jcmMpOworCX0KKwlpZ3RfYXNzZXJ0KGZvdW5kX3NraXApOworCisJZnJlZShjcmNzKTsKKwlp
Z3RfcGlwZV9jcmNfZnJlZShwaXBlX2NyYyk7CisJZGVzdHJveV9jb2xvcnMoZGF0YSwgY29sb3Jz
LCBBUlJBWV9TSVpFKGNvbG9ycykpOworfQorCisvKiBUZXN0IHdoZXRoZXIgb3Igbm90IElHVCBp
cyBhYmxlIHRvIGhhbmRsZSBmcmFtZSBza2lwcyB3aGVuIHJlcXVlc3RpbmcgdGhlCisgKiBDUkMg
Zm9yIHRoZSBjdXJyZW50IGZyYW1lCisgKi8KK3N0YXRpYyB2b2lkIHRlc3RfY3R4X2ZsaXBfc2tp
cF9jdXJyZW50X2ZyYW1lKGRhdGFfdCAqZGF0YSkKK3sKKwlzdHJ1Y3QgY29sb3JfZmIgY29sb3Jz
W10gPSB7CisJCXsgLnIgPSAxLjAsIC5nID0gMC4wLCAuYiA9IDAuMCB9LAorCQl7IC5yID0gMC4w
LCAuZyA9IDEuMCwgLmIgPSAwLjAgfSwKKwkJeyAuciA9IDAuMCwgLmcgPSAwLjAsIC5iID0gMS4w
IH0sCisJfTsKKwlpZ3Rfb3V0cHV0X3QgKm91dHB1dCA9IGRhdGEtPm91dHB1dDsKKwlpZ3RfcGlw
ZV9jcmNfdCAqcGlwZV9jcmM7CisJaWd0X3BsYW5lX3QgKnByaW1hcnkgPSBkYXRhLT5wcmltYXJ5
OworCWNvbnN0IGludCBmZCA9IGRhdGEtPmRybV9mZDsKKwljb25zdCBpbnQgbl9jb2xvcnMgPSBB
UlJBWV9TSVpFKGNvbG9ycyk7CisJY29uc3QgaW50IG5fY3JjcyA9IDMwOworCisJcGlwZV9jcmMg
PSBpZ3RfcGlwZV9jcmNfbmV3KGZkLCBkYXRhLT5waXBlLCAiYXV0byIpOworCWNyZWF0ZV9jb2xv
cnMoZGF0YSwgY29sb3JzLCBuX2NvbG9ycywgcGlwZV9jcmMpOworCisJc2V0X2NyY19mbGlwX3Ro
cmVzaG9sZChkYXRhLCA1KTsKKwlpZ3RfcGlwZV9jcmNfc3RhcnQocGlwZV9jcmMpOworCisJZm9y
IChpbnQgaSA9IDA7IGkgPCBuX2NyY3M7IGkrKykgeworCQlpZ3RfY3JjX3QgY3JjOworCQljb25z
dCBpbnQgY29sb3JfaWR4ID0gaSAlIG5fY29sb3JzOworCisJCWlndF9wbGFuZV9zZXRfZmIocHJp
bWFyeSwgJmNvbG9yc1tjb2xvcl9pZHhdLmZiKTsKKwkJZG9fb3JfZGllKGRybU1vZGVQYWdlRmxp
cChmZCwKKwkJCQkJICBvdXRwdXQtPmNvbmZpZy5jcnRjLT5jcnRjX2lkLAorCQkJCQkgIGNvbG9y
c1tjb2xvcl9pZHhdLmZiLmZiX2lkLAorCQkJCQkgIERSTV9NT0RFX1BBR0VfRkxJUF9FVkVOVCwK
KwkJCQkJICBOVUxMKSk7CisJCWttc3Rlc3Rfd2FpdF9mb3JfcGFnZWZsaXAoZmQpOworCisJCWln
dF9waXBlX2NyY19nZXRfY3VycmVudChmZCwgcGlwZV9jcmMsICZjcmMpOworCQlpZ3RfYXNzZXJ0
X2NyY19lcXVhbCgmY29sb3JzW2NvbG9yX2lkeF0uY3JjLCAmY3JjKTsKKwl9CisKKwlpZ3RfcGlw
ZV9jcmNfc3RvcChwaXBlX2NyYyk7CisJaWd0X3BpcGVfY3JjX2ZyZWUocGlwZV9jcmMpOworCWRl
c3Ryb3lfY29sb3JzKGRhdGEsIGNvbG9ycywgbl9jb2xvcnMpOworfQorCitzdGF0aWMgdm9pZCB0
ZXN0X2N0eF9mbGlwX3RocmVzaG9sZF9yZXNldF9hZnRlcl9jYXB0dXJlKGRhdGFfdCAqZGF0YSkK
K3sKKwlpZ3RfcGlwZV9jcmNfdCAqcGlwZV9jcmM7CisJY29uc3QgaW50IGZkID0gZGF0YS0+ZHJt
X2ZkOworCisJcGlwZV9jcmMgPSBpZ3RfcGlwZV9jcmNfbmV3KGZkLCBkYXRhLT5waXBlLCAiYXV0
byIpOworCisJc2V0X2NyY19mbGlwX3RocmVzaG9sZChkYXRhLCA1KTsKKwlpZ3RfcGlwZV9jcmNf
c3RhcnQocGlwZV9jcmMpOworCWlndF9waXBlX2NyY19zdG9wKHBpcGVfY3JjKTsKKworCWlndF9h
c3NlcnRfbmVxKGlndF9zeXNmc19nZXRfdTMyKGRhdGEtPm52X2NyY19kaXIsICJmbGlwX3RocmVz
aG9sZCIpLCA1KTsKKwlpZ3RfcGlwZV9jcmNfZnJlZShwaXBlX2NyYyk7Cit9CisKK3N0YXRpYyB2
b2lkIHRlc3Rfc291cmNlKGRhdGFfdCAqZGF0YSwgY29uc3QgY2hhciAqc291cmNlKQoreworCWln
dF9waXBlX2NyY190ICpwaXBlX2NyYyA9IGlndF9waXBlX2NyY19uZXcoZGF0YS0+ZHJtX2ZkLCBk
YXRhLT5waXBlLCBzb3VyY2UpOworCWlndF9jcmNfdCAqY3JjczsKKworCWlndF9waXBlX2NyY19z
dGFydChwaXBlX2NyYyk7CisJaWd0X3BpcGVfY3JjX2dldF9jcmNzKHBpcGVfY3JjLCAyLCAmY3Jj
cyk7CisJaWd0X3BpcGVfY3JjX3N0b3AocGlwZV9jcmMpOworCisJLyogVGhlIENSQyBzaG91bGRu
J3QgY2hhbmdlIGlmIHRoZSBzb3VyY2UgY29udGVudCBoYXNuJ3QgY2hhbmdlZCAqLworCWlndF9h
c3NlcnRfY3JjX2VxdWFsKCZjcmNzWzBdLCAmY3Jjc1sxXSk7CisKKwlpZ3RfcGlwZV9jcmNfZnJl
ZShwaXBlX2NyYyk7CisJZnJlZShjcmNzKTsKK30KKworc3RhdGljIHZvaWQgdGVzdF9zb3VyY2Vf
b3V0cF9pbmFjdGl2ZShkYXRhX3QgKmRhdGEpCit7CisJc3RydWN0IGNvbG9yX2ZiIGNvbG9yc1td
ID0geworCQl7IC5yID0gMS4wLCAuZyA9IDAuMCwgLmIgPSAwLjAgfSwKKwkJeyAuciA9IDAuMCwg
LmcgPSAxLjAsIC5iID0gMC4wIH0sCisJfTsKKwlpZ3RfcGlwZV9jcmNfdCAqcGlwZV9jcmM7CisJ
Y29uc3QgaW50IGZkID0gZGF0YS0+ZHJtX2ZkOworCWNvbnN0IGludCBuX2NvbG9ycyA9IEFSUkFZ
X1NJWkUoY29sb3JzKTsKKworCXBpcGVfY3JjID0gaWd0X3BpcGVfY3JjX25ldyhmZCwgZGF0YS0+
cGlwZSwgIm91dHAtaW5hY3RpdmUiKTsKKwljcmVhdGVfY29sb3JzKGRhdGEsIGNvbG9ycywgbl9j
b2xvcnMsIHBpcGVfY3JjKTsKKworCS8qIENoYW5naW5nIHRoZSBjb2xvciBzaG91bGQgbm90IGNo
YW5nZSB3aGF0J3Mgb3V0c2lkZSB0aGUgYWN0aXZlIHJhc3RlciAqLworCWlndF9hc3NlcnRfY3Jj
X2VxdWFsKCZjb2xvcnNbMF0uY3JjLCAmY29sb3JzWzFdLmNyYyk7CisKKwlpZ3RfcGlwZV9jcmNf
ZnJlZShwaXBlX2NyYyk7CisJZGVzdHJveV9jb2xvcnMoZGF0YSwgY29sb3JzLCBuX2NvbG9ycyk7
Cit9CisKK2RhdGFfdCBkYXRhID0gezAsIH07CisKKyNkZWZpbmUgcGlwZV90ZXN0KG5hbWUpIGln
dF9zdWJ0ZXN0X2YoInBpcGUtJXMtIiBuYW1lLCBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSkKK2ln
dF9tYWluCit7CisJaW50IHBpcGU7CisKKwlpZ3RfZml4dHVyZSB7CisJCWRhdGEuZHJtX2ZkID0g
ZHJtX29wZW5fZHJpdmVyX21hc3RlcihEUklWRVJfQU5ZKTsKKwkJaWd0X3JlcXVpcmVfbm91dmVh
dShkYXRhLmRybV9mZCk7CisKKwkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOworCisJ
CWlndF9yZXF1aXJlX3BpcGVfY3JjKGRhdGEuZHJtX2ZkKTsKKwkJaWd0X2Rpc3BsYXlfcmVxdWly
ZSgmZGF0YS5kaXNwbGF5LCBkYXRhLmRybV9mZCk7CisJCWlndF9kaXNwbGF5X3Jlc2V0KCZkYXRh
LmRpc3BsYXkpOworCX0KKworCWZvcl9lYWNoX3BpcGVfc3RhdGljKHBpcGUpIHsKKwkJaWd0X2Zp
eHR1cmUgeworCQkJaW50IGRpcjsKKworCQkJZGF0YS5waXBlID0gcGlwZTsKKwkJCWlndF9kaXNw
bGF5X3JlcXVpcmVfb3V0cHV0X29uX3BpcGUoJmRhdGEuZGlzcGxheSwgcGlwZSk7CisJCQlkYXRh
Lm91dHB1dCA9IGlndF9nZXRfc2luZ2xlX291dHB1dF9mb3JfcGlwZSgmZGF0YS5kaXNwbGF5LCBw
aXBlKTsKKwkJCWRhdGEubW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUoZGF0YS5vdXRwdXQpOwor
CisJCQkvKiBOb25lIG9mIHRoZXNlIHRlc3RzIG5lZWQgdG8gcGVyZm9ybSBtb2Rlc2V0cywKKwkJ
CSAqIGp1c3QgcGFnZSBmbGlwcy4gU28gcnVubmluZyBkaXNwbGF5IHNldHVwCisJCQkgKiBoZXJl
IGlzIGZpbmUKKwkJCSAqLworCQkJaWd0X291dHB1dF9zZXRfcGlwZShkYXRhLm91dHB1dCwgcGlw
ZSk7CisJCQlkYXRhLnByaW1hcnkgPSBpZ3Rfb3V0cHV0X2dldF9wbGFuZShkYXRhLm91dHB1dCwg
MCk7CisJCQlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRhdGEuZHJtX2ZkLAorCQkJCQkgICAgZGF0YS5t
b2RlLT5oZGlzcGxheSwKKwkJCQkJICAgIGRhdGEubW9kZS0+dmRpc3BsYXksCisJCQkJCSAgICBE
Uk1fRk9STUFUX1hSR0I4ODg4LAorCQkJCQkgICAgTE9DQUxfRFJNX0ZPUk1BVF9NT0RfTk9ORSwK
KwkJCQkJICAgIDAuMCwgMC4wLCAwLjAsCisJCQkJCSAgICAmZGF0YS5kZWZhdWx0X2ZiKTsKKwkJ
CWlndF9wbGFuZV9zZXRfZmIoZGF0YS5wcmltYXJ5LCAmZGF0YS5kZWZhdWx0X2ZiKTsKKwkJCWln
dF9kaXNwbGF5X2NvbW1pdCgmZGF0YS5kaXNwbGF5KTsKKworCQkJZGlyID0gaWd0X2RlYnVnZnNf
cGlwZV9kaXIoZGF0YS5kcm1fZmQsIHBpcGUsIE9fRElSRUNUT1JZKTsKKwkJCWlndF9yZXF1aXJl
X2ZkKGRpcik7CisJCQlkYXRhLm52X2NyY19kaXIgPSBvcGVuYXQoZGlyLCAibnZfY3JjIiwgT19E
SVJFQ1RPUlkpOworCQkJY2xvc2UoZGlyKTsKKwkJCWlndF9yZXF1aXJlX2ZkKGRhdGEubnZfY3Jj
X2Rpcik7CisJCX0KKworCQkvKiBXZSBkb24ndCBuZWVkIHRvIHRlc3QgdGhpcyBvbiBldmVyeSBw
aXBlLCBidXQgdGhlCisJCSAqIHNldHVwIGlzIHRoZSBzYW1lICovCisJCWlmIChwaXBlID09IFBJ
UEVfQSkgeworCQkJaWd0X2Rlc2NyaWJlKCJNYWtlIHN1cmUgdGhhdCB0aGUgQ1JDIG5vdGlmaWVy
IGNvbnRleHQgZmxpcCB0aHJlc2hvbGQgIgorCQkJCSAgICAgImlzIHJlc2V0IHRvIGl0cyBkZWZh
dWx0IHZhbHVlIGFmdGVyIGEgc2luZ2xlIGNhcHR1cmUuIik7CisJCQlpZ3Rfc3VidGVzdCgiY3R4
LWZsaXAtdGhyZXNob2xkLXJlc2V0LWFmdGVyLWNhcHR1cmUiKQorCQkJCXRlc3RfY3R4X2ZsaXBf
dGhyZXNob2xkX3Jlc2V0X2FmdGVyX2NhcHR1cmUoJmRhdGEpOworCQl9CisKKwkJaWd0X2Rlc2Ny
aWJlKCJNYWtlIHN1cmUgdGhlIGFzc29jaWF0aW9uIGJldHdlZW4gZWFjaCBDUkMgYW5kIGl0cyAi
CisJCQkgICAgICJyZXNwZWN0aXZlIGZyYW1lIGluZGV4IGlzIG5vdCBicm9rZW4gd2hlbiB0aGUg
ZHJpdmVyICIKKwkJCSAgICAgInBlcmZvcm1zIGEgbm90aWZpZXIgY29udGV4dCBmbGlwLiIpOwor
CQlwaXBlX3Rlc3QoImN0eC1mbGlwLWRldGVjdGlvbiIpCisJCQl0ZXN0X2N0eF9mbGlwX2RldGVj
dGlvbigmZGF0YSk7CisKKwkJaWd0X2Rlc2NyaWJlKCJNYWtlIHN1cmUgdGhhdCBpZ3RfcGlwZV9j
cmNfZ2V0X2N1cnJlbnQoKSB3b3JrcyBldmVuICIKKwkJCSAgICAgIndoZW4gdGhlIENSQyBmb3Ig
dGhlIGN1cnJlbnQgZnJhbWUgaW5kZXggaXMgbG9zdC4iKTsKKwkJcGlwZV90ZXN0KCJjdHgtZmxp
cC1za2lwLWN1cnJlbnQtZnJhbWUiKQorCQkJdGVzdF9jdHhfZmxpcF9za2lwX2N1cnJlbnRfZnJh
bWUoJmRhdGEpOworCisJCWlndF9kZXNjcmliZSgiQ2hlY2sgdGhhdCBiYXNpYyBDUkMgcmVhZGJh
Y2sgdXNpbmcgdGhlIG91dHAtY29tcGxldGUgIgorCQkJICAgICAic291cmNlIHdvcmtzLiIpOwor
CQlwaXBlX3Rlc3QoInNvdXJjZS1vdXRwLWNvbXBsZXRlIikKKwkJCXRlc3Rfc291cmNlKCZkYXRh
LCAib3V0cC1jb21wbGV0ZSIpOworCisJCWlndF9kZXNjcmliZSgiQ2hlY2sgdGhhdCBiYXNpYyBD
UkMgcmVhZGJhY2sgdXNpbmcgdGhlIHJnIHNvdXJjZSAiCisJCQkgICAgICJ3b3Jrcy4iKTsKKwkJ
cGlwZV90ZXN0KCJzb3VyY2UtcmciKQorCQkJdGVzdF9zb3VyY2UoJmRhdGEsICJyZyIpOworCisJ
CWlndF9kZXNjcmliZSgiTWFrZSBzdXJlIHRoYXQgdGhlIG91dHAtaW5hY3RpdmUgc291cmNlIGlz
IGFjdHVhbGx5ICIKKwkJCSAgICAgImNhcHR1cmluZyB0aGUgaW5hY3RpdmUgcmFzdGVyLiIpOwor
CQlwaXBlX3Rlc3QoInNvdXJjZS1vdXRwLWluYWN0aXZlIikKKwkJCXRlc3Rfc291cmNlX291dHBf
aW5hY3RpdmUoJmRhdGEpOworCisJCWlndF9maXh0dXJlIHsKKwkJCWlndF9vdXRwdXRfc2V0X3Bp
cGUoZGF0YS5vdXRwdXQsIFBJUEVfTk9ORSk7CisJCQlpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEu
ZGlzcGxheSk7CisJCQlpZ3RfcmVtb3ZlX2ZiKGRhdGEuZHJtX2ZkLCAmZGF0YS5kZWZhdWx0X2Zi
KTsKKwkJCWNsb3NlKGRhdGEubnZfY3JjX2Rpcik7CisJCX0KKwl9CisJaWd0X2ZpeHR1cmUKKwkJ
aWd0X2Rpc3BsYXlfZmluaSgmZGF0YS5kaXNwbGF5KTsKKworfQotLSAKMi4yNi4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
