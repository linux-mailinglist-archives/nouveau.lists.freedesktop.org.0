Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6582C3DE
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2019 12:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE7F89BD2;
	Tue, 28 May 2019 10:04:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 28 May 2019 10:04:00 UTC
Received: from milared.bluegap.ch (milared.bluegap.ch
 [IPv6:2a01:4f8:c17:2c0c::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF5B89BD2
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2019 10:04:00 +0000 (UTC)
Received: from [10.80.10.34] (c-213-160-37-181.customer.ggaweb.ch
 [::ffff:213.160.37.181])
 (AUTH: PLAIN markus@bluegap.ch, SSL: TLS1.2, 128bits,
 ECDHE_RSA_AES_128_GCM_SHA256)
 by milared.bluegap.ch with ESMTPSA; Tue, 28 May 2019 09:58:55 +0000
 id 0000000000353EF7.000000005CED0660.000017DD
To: nouveau@lists.freedesktop.org
From: Markus Wanner <markus@bluegap.ch>
Openpgp: preference=signencrypt
Autocrypt: addr=markus@bluegap.ch; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2b626681-3504-c7e9-10d2-0f906dcb176d@bluegap.ch>
Date: Tue, 28 May 2019 11:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-GB
Subject: [Nouveau] Support for GP107(GL)M with Optimus
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

SGksCgpJIHJlY2VudGx5IGFkZGVkIGxvZ3MgYW5kIGFub3RoZXIgcmVwb3J0IGZyb20gYSBUaGlu
a1BhZCBQMSB3aXRoIGEKUXVhZHJvIFAyMDAwIE1vYmlsZSAoR1AxMDdHTE0pIHRvIGlzc3VlICMx
MDAyMjguCgpUaGF0J3Mgd2l0aCBhIHZlcnkgcmVjZW50IExpbnV4IGtlcm5lbCBhbmQgY3VycmVu
dCBub3V2ZWF1IGRyaXZlcgpzb3VyY2VzLCBhbGwgYm9vdGVkIGZyb20gYW4gTkZTLXJvb3Qgc2V0
dXAsIG1ha2luZyBpdCB3ZWxsIHJlcHJvZHVjaWJsZS4KIEkgY2FuIG9wdGlvbmFsbHkgYm9vdCBp
bnRvIGEgc2ltaWxhciBORlMgaW5zdGFsbGF0aW9uIHdpdGggdGhlCnByb3ByaWV0YXJ5IE52aWRp
YSBkcml2ZXIsIGFsbG93aW5nIG1lIHRvIGNhcHR1cmUgTU1JTyB0cmFjZXMgYXMgd2VsbC4KCkhv
d2V2ZXIsIEknbSBub3Qgc3VyZSB3aGVyZSB0byBnbyBmcm9tIGhlcmUgYW5kIHdvdWxkIGFwcHJl
Y2lhdGUgc29tZQpoZWxwIGluIGRpYWdub3NpbmcgdGhpcyBhbmQvb3IgbW92aW5nIGl0IGZvcndh
cmQuICBJJ20gYSBwcm9mZXNzaW9uYWwKYW5kIGV4cGVyaWVuY2VkIGRldmVsb3BlciwgYnV0IGhh
dmUgcGxlbnR5IG9mIG90aGVyIGludGVyZXN0aW5nIHByb2plY3RzCm9uIG15IHRhYmxlLCBhbHJl
YWR5LgoKRG8gb3JkaW5hcnkgKG5vbi1PcHRpbXVzKSBzZXR1cHMgd2l0aCBHUDEwNyB3b3JrPyAg
V2hhdCBkbyB5b3UgbG9vayBmb3IKd2hlbiByZWFkaW5nIE1NSU8gdHJhY2VzPyAgV2hhdCBhY2Nv
bXBhbnlpbmcgZGF0YSBkbyBJIG5lZWQgdG8gY29sbGVjdD8KCktpbmQgUmVnYXJkcwoKTWFya3Vz
IFdhbm5lcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
