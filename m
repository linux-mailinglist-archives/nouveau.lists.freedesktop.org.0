Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21699D5AAA
	for <lists+nouveau@lfdr.de>; Mon, 14 Oct 2019 07:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96346E1F1;
	Mon, 14 Oct 2019 05:22:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4818E6E1F1;
 Mon, 14 Oct 2019 05:22:37 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id x134so14851746qkb.0;
 Sun, 13 Oct 2019 22:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SG/SbsHJJu27RpK09p6XBqry+5X4Ltmmk0yeAt3pCNs=;
 b=DkINp/Zq5B2nELO999LPIxEpzpRtoZ1HbBYoJPZ+Ygen0lOrwBu/IESEbBeIxInYa+
 9UPH+DAedoK9vhSdHBIFsEHI43v/yp9LVazvN5BkGbYPsH3nPHqyEzGRfakhOFLhsc7+
 8comD2UunghVAVMnJTXEwPhX+OjdPVjs48BvpM1/bo3GkvgI5n8rx4BCpNePn7+Rc5Nj
 waRiZfLmHo7+IIvQ4VEj1sfW62qAuOZt+18tlBoJauA2aYYbp+0z3EJVDpeXEL7cOPCl
 e05YbA5MGDP0dQzaOdmyaQ05KR/PtVnFAaEH3cTLHvp8ltPnd/QJp+rNkJ8KjR2TNex2
 SbcA==
X-Gm-Message-State: APjAAAU3tfwQepmqlB7i2HXw3b+YIgOD+ZOz9mLAmhy6desZzRE6wtQZ
 D5IiZPCoHLSeD11f82F6i874kxrJ1CU=
X-Google-Smtp-Source: APXvYqyzhjb/XH3x4I4g1rzvKo08sUkS5Cv9W5BkrRIQrCJoIPfX0KbfMzIaUwVB1l+wED23HimfTA==
X-Received: by 2002:a05:620a:2193:: with SMTP id
 g19mr27814901qka.182.1571030555712; 
 Sun, 13 Oct 2019 22:22:35 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
 by smtp.gmail.com with ESMTPSA id n21sm7998585qka.83.2019.10.13.22.22.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Oct 2019 22:22:34 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: mesa-dev@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Mon, 14 Oct 2019 01:22:33 -0400
Message-Id: <20191014052233.30968-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SG/SbsHJJu27RpK09p6XBqry+5X4Ltmmk0yeAt3pCNs=;
 b=nGppQUo5BF4WiPlnNQeS2//QlfVSR/a4DVHvp7qOwZjcyU9pyLBqaKhy3+R7OXtNeP
 WUQdsoIxQh50LjLlqunpKI4thMy+Qib8UCoD99if9xaSBsl+xSvRRFAP5jaQ7Ulr3XfH
 T7q+djAk1s987Hl7yRaKbLFQHafveEW+zoPr/Ai4oiOFmRkx5onEoYmusS1ek3jxIcoF
 ULWDlEpLvqMZnAVlEe7yflQUMNa7KpIXaFDZ4iNsDpXABHMUg2oWJIgDmOxuk2ZpjdZa
 KQV0MyrTJ4r83Y36mSADO4YcS34na4TBBilJrSX8SvtMd2zryB7KEkPDexH7FYrUDdOO
 9/PA==
Subject: [Nouveau] [PATCH] gm107/ir: fix loading z offset for layered 3d
 image bindings
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

VW5mb3J0dWFudGVseSB3ZSBkb24ndCBrbm93IGlmIGEgcGFydGljdWxhciBsb2FkIGlzIGEgcmVh
bCAyZCBpbWFnZSAoYXMKd291bGQgYmUgYSBjdWJlIGZhY2Ugb3IgMmQgYXJyYXkgZWxlbWVudCks
IG9yIGEgbGF5ZXIgb2YgYSAzZCBpbWFnZS4KU2luY2Ugd2UgcGFzcyBpbiB0aGUgVElDIHJlZmVy
ZW5jZSwgdGhlIGluc3RydWN0aW9uJ3MgdHlwZSBoYXMgdG8gbWF0Y2gKd2hhdCdzIGluIHRoZSBU
SUMgKGV4cGVyaW1lbnRhbGx5KS4gSW4gb3JkZXIgdG8gcHJvcGVybHkgc3VwcG9ydApiaW5kbGVz
cyBpbWFnZXMsIHRoaXMgYWxzbyBjYW4ndCBiZSBkb25lIGJ5IGxvb2tpbmcgYXQgdGhlIGN1cnJl
bnQKYmluZGluZ3MgYW5kIGdlbmVyYXRpbmcgYXBwcm9wcmlhdGUgY29kZS4KCkFzIGEgcmVzdWx0
IGFsbCBwbGFpbiAyZCBsb2FkcyBhcmUgY29udmVydGVkIGludG8gYSBwYWlyIG9mIDJkLzNkIGxv
YWRzLAp3aXRoIGFwcHJvcHJpYXRlIHByZWRpY2F0ZXMgdG8gZW5zdXJlIG9ubHkgb25lIG9mIHRo
b3NlIGFjdHVhbGx5CmV4ZWN1dGVzLCBhbmQgdGhlIHZhbHVlcyBhcmUgYWxsIG1lcmdlZCBpbi4K
ClRoaXMgZ29lcyBzb21ld2hhdCBhZ2FpbnN0IHRoZSBjdXJyZW50IGZsb3csIHNvIGZvciBHTTEw
NyB3ZSBkbyB0aGUgT09CCmhhbmRsaW5nIGRpcmVjdGx5IGluIHRoZSBzdXJmYWNlIHByb2Nlc3Np
bmcgbG9naWMuIFBlcmhhcHMgdGhlIG90aGVyCmdlbnMgc2hvdWxkIGRvIHNvbWV0aGluZyBzaW1p
bGFyLCBidXQgdGhhdCBpcyBsZWZ0IHRvIGFub3RoZXIgY2hhbmdlLgoKVGhpcyBmaXhlcyBkRVFQ
IHRlc3RzIGxpa2UgaW1hZ2VfbG9hZF9zdG9yZS4zZC4qX3NpbmdsZV9sYXllciBhbmQgR0wtQ1RT
CnRlc3RzIGxpa2Ugc2hhZGVyX2ltYWdlX2xvYWRfc3RvcmUubm9uLWxheWVyZWRfYmluZGluZyB3
aXRob3V0IGJyZWFraW5nCmFueXRoaW5nIGVsc2UuCgpTaWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtp
biA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Ci0tLQoKT0ssIGZpcnN0IG9mIGFsbCAtLSB0byB3aG9l
dmVyIHRob3VnaHQgdGhhdCBiaW5kaW5nIHNpbmdsZSBsYXllcnMgb2YgYSAzZAppbWFnZSBhbmQg
dGVsbGluZyB0aGUgc2hhZGVyIHRoZXkgd2VyZSByZWd1bGFyIDJkIGltYWdlcyB3YXMgYSBnb29k
IGlkZWEgLS0KSSBkaXNhZ3JlZS4KClRoaXMgY2hhbmdlIGZlZWxzIHN1cGVyIHN1cGVyIGRpcnR5
LCBidXQgSSBob25lc3RseSBkb24ndCBzZWUgYSBtYXRlcmlhbGx5CmNsZWFuZXIgd2F5IG9mIGhh
bmRsaW5nIGl0LiBJbnN0ZWFkIG9mIGJlaW5nIGFibGUgdG8gcmV1c2UgdGhlIE9PQgpoYW5kbGlu
ZywgaXQncyBwdXQgaW4gd2l0aCB0aGUgY29vcmQgcHJvY2Vzc2luZyAoISksIGFuZCB0aGUgc3Vy
ZmFjZQpjb252ZXJzaW9uIGZ1bmN0aW9uIGlzIHNlcmlvdXNseSBoYWNrZWQgdXAuCgpCdXQgc3Bs
aXR0aW5nIGl0IHVwIGlzIGhhcmRlciwgc2luY2UgYSBsb3Qgb2YgaW5mb3JtYXRpb24gaGFzIHRv
IGZsb3cKZnJvbSBzdGFnZSB0byBzdGFnZSwgbGlrZSB3aGVuIHRvIGRvIHdoYXQga2luZCBvZiBh
Y2Nlc3MsIGFuZCBjbG9uaW5nCnRoZSBzdXJmYWNlIG9wIGlzIG11Y2ggZWFzaWVyIGluIHRoZSBj
b29yZCBwcm9jZXNzaW5nIHN0YWdlLgoKIC4uLi9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9lbWl0
X2dtMTA3LmNwcCAgICB8ICAzNCArKy0KIC4uLi9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9sb3dl
cmluZ19udmMwLmNwcCB8IDIwNiArKysrKysrKysrKysrLS0tLS0KIC4uLi9ub3V2ZWF1L2NvZGVn
ZW4vbnY1MF9pcl9sb3dlcmluZ19udmMwLmggICB8ICAgNCArLQogc3JjL2dhbGxpdW0vZHJpdmVy
cy9ub3V2ZWF1L252YzAvbnZjMF90ZXguYyAgIHwgIDEwICstCiA0IGZpbGVzIGNoYW5nZWQsIDIw
MSBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1
bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2VtaXRfZ20xMDcuY3BwIGIvc3JjL2dh
bGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9lbWl0X2dtMTA3LmNwcAppbmRl
eCA2ZWVmZThmMDAyNS4uZTI0NGJkMGQ2MTAgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVtL2RyaXZl
cnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZW1pdF9nbTEwNy5jcHAKKysrIGIvc3JjL2dhbGxp
dW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9lbWl0X2dtMTA3LmNwcApAQCAtMTIy
LDYgKzEyMiw4IEBAIHByaXZhdGU6CiAgICB2b2lkIGVtaXRTQU0oKTsKICAgIHZvaWQgZW1pdFJB
TSgpOwogCisgICB2b2lkIGVtaXRQU0VUUCgpOworCiAgICB2b2lkIGVtaXRNT1YoKTsKICAgIHZv
aWQgZW1pdFMyUigpOwogICAgdm9pZCBlbWl0Q1MyUigpOwpAQCAtNjkwLDYgKzY5MiwzMSBAQCBD
b2RlRW1pdHRlckdNMTA3OjplbWl0UkFNKCkKICAqIHByZWRpY2F0ZS9jYwogICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8KIAordm9pZAorQ29kZUVtaXR0ZXJHTTEwNzo6ZW1pdFBTRVRQKCkKK3sKKwor
ICAgZW1pdEluc24oMHg1MDkwMDAwMCk7CisKKyAgIHN3aXRjaCAoaW5zbi0+b3ApIHsKKyAgIGNh
c2UgT1BfQU5EOiBlbWl0RmllbGQoMHgxOCwgMywgMCk7IGJyZWFrOworICAgY2FzZSBPUF9PUjog
IGVtaXRGaWVsZCgweDE4LCAzLCAxKTsgYnJlYWs7CisgICBjYXNlIE9QX1hPUjogZW1pdEZpZWxk
KDB4MTgsIDMsIDIpOyBicmVhazsKKyAgIGRlZmF1bHQ6CisgICAgICBhc3NlcnQoISJ1bmV4cGVj
dGVkIG9wZXJhdGlvbiIpOworICAgICAgYnJlYWs7CisgICB9CisKKyAgIC8vIGVtaXRJTlYgKDB4
MmEpOworICAgZW1pdFBSRUQoMHgyNyk7IC8vIFRPRE86IHN1cHBvcnQgMy1hcmcKKyAgIGVtaXRJ
TlYgKDB4MjAsIGluc24tPnNyYygxKSk7CisgICBlbWl0UFJFRCgweDFkLCBpbnNuLT5zcmMoMSkp
OworICAgZW1pdElOViAoMHgwZiwgaW5zbi0+c3JjKDApKTsKKyAgIGVtaXRQUkVEKDB4MGMsIGlu
c24tPnNyYygwKSk7CisgICBlbWl0UFJFRCgweDAzLCBpbnNuLT5kZWYoMCkpOworICAgZW1pdFBS
RUQoMHgwMCk7Cit9CisKIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBtb3ZlbWVudCAvIGNv
bnZlcnNpb24KICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCkBAIC0zNTU3LDcgKzM1ODQsMTIgQEAg
Q29kZUVtaXR0ZXJHTTEwNzo6ZW1pdEluc3RydWN0aW9uKEluc3RydWN0aW9uICppKQogICAgY2Fz
ZSBPUF9BTkQ6CiAgICBjYXNlIE9QX09SOgogICAgY2FzZSBPUF9YT1I6Ci0gICAgICBlbWl0TE9Q
KCk7CisgICAgICBzd2l0Y2ggKGluc24tPmRlZigwKS5nZXRGaWxlKCkpIHsKKyAgICAgIGNhc2Ug
RklMRV9HUFI6IGVtaXRMT1AoKTsgYnJlYWs7CisgICAgICBjYXNlIEZJTEVfUFJFRElDQVRFOiBl
bWl0UFNFVFAoKTsgYnJlYWs7CisgICAgICBkZWZhdWx0OgorICAgICAgICAgYXNzZXJ0KCEiaW52
YWxpZCBib29sIG9wIik7CisgICAgICB9CiAgICAgICBicmVhazsKICAgIGNhc2UgT1BfTk9UOgog
ICAgICAgZW1pdE5PVCgpOwpkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1
L2NvZGVnZW4vbnY1MF9pcl9sb3dlcmluZ19udmMwLmNwcCBiL3NyYy9nYWxsaXVtL2RyaXZlcnMv
bm91dmVhdS9jb2RlZ2VuL252NTBfaXJfbG93ZXJpbmdfbnZjMC5jcHAKaW5kZXggMWY3MDJhOTg3
ZDguLjBmNjhhOWEyMjlmIDEwMDY0NAotLS0gYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUv
Y29kZWdlbi9udjUwX2lyX2xvd2VyaW5nX252YzAuY3BwCisrKyBiL3NyYy9nYWxsaXVtL2RyaXZl
cnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfbG93ZXJpbmdfbnZjMC5jcHAKQEAgLTE4MDIsNiAr
MTgwMiw5IEBAIE5WQzBMb3dlcmluZ1Bhc3M6OmxvYWRTdUluZm8zMihWYWx1ZSAqcHRyLCBpbnQg
c2xvdCwgdWludDMyX3Qgb2ZmLCBib29sIGJpbmRsZXNzCiB7CiAgICB1aW50MzJfdCBiYXNlID0g
c2xvdCAqIE5WQzBfU1VfSU5GT19fU1RSSURFOwogCisgICAvLyBXZSBkb24ndCB1cGxvYWQgc3Vy
ZmFjZSBpbmZvIGZvciBiaW5kbGVzcyBmb3IgR00xMDcrCisgICBhc3NlcnQoIWJpbmRsZXNzIHx8
IHRhcmctPmdldENoaXBzZXQoKSA8IE5WSVNBX0dNMTA3X0NISVBTRVQpOworCiAgICBpZiAocHRy
KSB7CiAgICAgICBwdHIgPSBibGQubWtPcDJ2KE9QX0FERCwgVFlQRV9VMzIsIGJsZC5nZXRTU0Eo
KSwgcHRyLCBibGQubWtJbW0oc2xvdCkpOwogICAgICAgaWYgKGJpbmRsZXNzKQpAQCAtMjIwNCw3
ICsyMjA3LDcgQEAgZ2V0RGVzdFR5cGUoY29uc3QgSW1nVHlwZSB0eXBlKSB7CiB9CiAKIHZvaWQK
LU5WQzBMb3dlcmluZ1Bhc3M6OmNvbnZlcnRTdXJmYWNlRm9ybWF0KFRleEluc3RydWN0aW9uICpz
dSkKK05WQzBMb3dlcmluZ1Bhc3M6OmNvbnZlcnRTdXJmYWNlRm9ybWF0KFRleEluc3RydWN0aW9u
ICpzdSwgSW5zdHJ1Y3Rpb24gKipsb2FkZWQpCiB7CiAgICBjb25zdCBUZXhJbnN0cnVjdGlvbjo6
SW1nRm9ybWF0RGVzYyAqZm9ybWF0ID0gc3UtPnRleC5mb3JtYXQ7CiAgICBpbnQgd2lkdGggPSBm
b3JtYXQtPmJpdHNbMF0gKyBmb3JtYXQtPmJpdHNbMV0gKwpAQCAtMjIyMywyMSArMjIyNiwzOCBA
QCBOVkMwTG93ZXJpbmdQYXNzOjpjb252ZXJ0U3VyZmFjZUZvcm1hdChUZXhJbnN0cnVjdGlvbiAq
c3UpCiAgICBpZiAod2lkdGggPCAzMikKICAgICAgIHVudHlwZWREc3RbMF0gPSBibGQuZ2V0U1NB
KCk7CiAKLSAgIGZvciAoaW50IGkgPSAwOyBpIDwgNDsgaSsrKSB7Ci0gICAgICB0eXBlZERzdFtp
XSA9IHN1LT5nZXREZWYoaSk7CisgICBpZiAobG9hZGVkICYmIGxvYWRlZFswXSkgeworICAgICAg
Zm9yIChpbnQgaSA9IDA7IGkgPCA0OyBpKyspIHsKKyAgICAgICAgIGlmIChsb2FkZWRbaV0pCisg
ICAgICAgICAgICB0eXBlZERzdFtpXSA9IGxvYWRlZFtpXS0+Z2V0RGVmKDApOworICAgICAgfQor
ICAgfSBlbHNlIHsKKyAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgNDsgaSsrKSB7CisgICAgICAg
ICB0eXBlZERzdFtpXSA9IHN1LT5nZXREZWYoaSk7CisgICAgICB9CiAgICB9CiAKICAgIC8vIFNl
dCB0aGUgdW50eXBlZCBkc3RzIGFzIHRoZSBzdSdzIGRlc3RpbmF0aW9ucwotICAgZm9yIChpbnQg
aSA9IDA7IGkgPCA0OyBpKyspCi0gICAgICBzdS0+c2V0RGVmKGksIHVudHlwZWREc3RbaV0pOwor
ICAgaWYgKGxvYWRlZCAmJiBsb2FkZWRbMF0pIHsKKyAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
NDsgaSsrKQorICAgICAgICAgaWYgKGxvYWRlZFtpXSkKKyAgICAgICAgICAgIGxvYWRlZFtpXS0+
c2V0RGVmKDAsIHVudHlwZWREc3RbaV0pOworICAgfSBlbHNlIHsKKyAgICAgIGZvciAoaW50IGkg
PSAwOyBpIDwgNDsgaSsrKQorICAgICAgICAgc3UtPnNldERlZihpLCB1bnR5cGVkRHN0W2ldKTsK
IAotICAgYmxkLnNldFBvc2l0aW9uKHN1LCB0cnVlKTsKKyAgICAgIGJsZC5zZXRQb3NpdGlvbihz
dSwgdHJ1ZSk7CisgICB9CiAKICAgIC8vIFVucGFjayBlYWNoIGNvbXBvbmVudCBpbnRvIHRoZSB0
eXBlZCBkc3RzCiAgICBpbnQgYml0cyA9IDA7CiAgICBmb3IgKGludCBpID0gMDsgaSA8IDQ7IGJp
dHMgKz0gZm9ybWF0LT5iaXRzW2ldLCBpKyspIHsKICAgICAgIGlmICghdHlwZWREc3RbaV0pCiAg
ICAgICAgICBjb250aW51ZTsKKworICAgICAgaWYgKGxvYWRlZCAmJiBsb2FkZWRbMF0pCisgICAg
ICAgICBibGQuc2V0UG9zaXRpb24obG9hZGVkW2ldLCB0cnVlKTsKKwogICAgICAgaWYgKGkgPj0g
Zm9ybWF0LT5jb21wb25lbnRzKSB7CiAgICAgICAgICBpZiAoZm9ybWF0LT50eXBlID09IEZMT0FU
IHx8CiAgICAgICAgICAgICAgZm9ybWF0LT50eXBlID09IFVOT1JNIHx8CkBAIC0yMzA4LDcgKzIz
MjgsNyBAQCBOVkMwTG93ZXJpbmdQYXNzOjpoYW5kbGVTdXJmYWNlT3BOVkU0KFRleEluc3RydWN0
aW9uICpzdSkKICAgIHByb2Nlc3NTdXJmYWNlQ29vcmRzTlZFNChzdSk7CiAKICAgIGlmIChzdS0+
b3AgPT0gT1BfU1VMRFApIHsKLSAgICAgIGNvbnZlcnRTdXJmYWNlRm9ybWF0KHN1KTsKKyAgICAg
IGNvbnZlcnRTdXJmYWNlRm9ybWF0KHN1LCBOVUxMKTsKICAgICAgIGluc2VydE9PQlN1cmZhY2VP
cFJlc3VsdChzdSk7CiAgICB9CiAKQEAgLTI0MjEsNyArMjQ0MSw3IEBAIE5WQzBMb3dlcmluZ1Bh
c3M6OmhhbmRsZVN1cmZhY2VPcE5WQzAoVGV4SW5zdHJ1Y3Rpb24gKnN1KQogICAgcHJvY2Vzc1N1
cmZhY2VDb29yZHNOVkMwKHN1KTsKIAogICAgaWYgKHN1LT5vcCA9PSBPUF9TVUxEUCkgewotICAg
ICAgY29udmVydFN1cmZhY2VGb3JtYXQoc3UpOworICAgICAgY29udmVydFN1cmZhY2VGb3JtYXQo
c3UsIE5VTEwpOwogICAgICAgaW5zZXJ0T09CU3VyZmFjZU9wUmVzdWx0KHN1KTsKICAgIH0KIApA
QCAtMjQ2MywxNCArMjQ4MywxNiBAQCBOVkMwTG93ZXJpbmdQYXNzOjpoYW5kbGVTdXJmYWNlT3BO
VkMwKFRleEluc3RydWN0aW9uICpzdSkKICAgIH0KIH0KIAotdm9pZAotTlZDMExvd2VyaW5nUGFz
czo6cHJvY2Vzc1N1cmZhY2VDb29yZHNHTTEwNyhUZXhJbnN0cnVjdGlvbiAqc3UpCitUZXhJbnN0
cnVjdGlvbiAqCitOVkMwTG93ZXJpbmdQYXNzOjpwcm9jZXNzU3VyZmFjZUNvb3Jkc0dNMTA3KFRl
eEluc3RydWN0aW9uICpzdSwgSW5zdHJ1Y3Rpb24gKnJldFs0XSkKIHsKICAgIGNvbnN0IGludCBz
bG90ID0gc3UtPnRleC5yOwogICAgY29uc3QgaW50IGRpbSA9IHN1LT50ZXgudGFyZ2V0LmdldERp
bSgpOwotICAgY29uc3QgaW50IGFyZyA9IGRpbSArIChzdS0+dGV4LnRhcmdldC5pc0FycmF5KCkg
fHwgc3UtPnRleC50YXJnZXQuaXNDdWJlKCkpOworICAgY29uc3QgYm9vbCBhcnJheSA9IHN1LT50
ZXgudGFyZ2V0LmlzQXJyYXkoKSB8fCBzdS0+dGV4LnRhcmdldC5pc0N1YmUoKTsKKyAgIGNvbnN0
IGludCBhcmcgPSBkaW0gKyBhcnJheTsKICAgIFZhbHVlICppbmQgPSBzdS0+Z2V0SW5kaXJlY3RS
KCk7CiAgICBWYWx1ZSAqaGFuZGxlOworICAgSW5zdHJ1Y3Rpb24gKnByZWQgPSBOVUxMLCAqcHJl
ZDJkID0gTlVMTDsKICAgIGludCBwb3MgPSAwOwogCiAgICBibGQuc2V0UG9zaXRpb24oc3UsIGZh
bHNlKTsKQEAgLTI0ODksNjcgKzI1MTEsMTUzIEBAIE5WQzBMb3dlcmluZ1Bhc3M6OnByb2Nlc3NT
dXJmYWNlQ29vcmRzR00xMDcoVGV4SW5zdHJ1Y3Rpb24gKnN1KQogICAgICAgYXNzZXJ0KHBvcyA9
PSAwKTsKICAgICAgIGJyZWFrOwogICAgfQorCisgICBpZiAoZGltID09IDIgJiYgIWFycmF5KSB7
CisgICAgICAvLyBUaGlzIG1pZ2h0IGJlIGEgMmQgc2xpY2Ugb2YgYSAzZCB0ZXh0dXJlLCB0cnkg
dG8gbG9hZCB0aGUgegorICAgICAgLy8gY29vcmRpbmF0ZSBpbi4KKyAgICAgIFZhbHVlICp2Owor
ICAgICAgaWYgKCFzdS0+dGV4LmJpbmRsZXNzKQorICAgICAgICAgdiA9IGxvYWRTdUluZm8zMihp
bmQsIHNsb3QsIE5WQzBfU1VfSU5GT19VTksxQywgc3UtPnRleC5iaW5kbGVzcyk7CisgICAgICBl
bHNlCisgICAgICAgICB2ID0gYmxkLm1rT3AydihPUF9TSFIsIFRZUEVfVTMyLCBibGQuZ2V0U1NB
KCksIGluZCwgYmxkLm1rSW1tKDExKSk7CisgICAgICBWYWx1ZSAqaXNfM2QgPSBibGQubWtPcDJ2
KE9QX0FORCwgVFlQRV9VMzIsIGJsZC5nZXRTU0EoKSwgdiwgYmxkLm1rSW1tKDEpKTsKKyAgICAg
IHByZWQyZCA9IGJsZC5ta0NtcChPUF9TRVQsIENDX0VRLCBUWVBFX1UzMiwgYmxkLmdldFNTQSgx
LCBGSUxFX1BSRURJQ0FURSksCisgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRV9VMzIsIGJs
ZC5ta0ltbSgwKSwgaXNfM2QpOworCisgICAgICBibGQubWtPcDIoT1BfU0hSLCBUWVBFX1UzMiwg
diwgdiwgYmxkLmxvYWRJbW0oTlVMTCwgMTYpKTsKKyAgICAgIHN1LT5tb3ZlU291cmNlcyhkaW0s
IDEpOworICAgICAgc3UtPnNldFNyYyhkaW0sIHYpOworICAgICAgc3UtPnRleC50YXJnZXQgPSBu
djUwX2lyOjpURVhfVEFSR0VUXzNEOworICAgICAgcG9zKys7CisgICB9CisKICAgIGlmIChzdS0+
dGV4LmJpbmRsZXNzKQogICAgICAgaGFuZGxlID0gaW5kOwogICAgZWxzZQogICAgICAgaGFuZGxl
ID0gbG9hZFRleEhhbmRsZShpbmQsIHNsb3QgKyAzMik7CisKICAgIHN1LT5zZXRTcmMoYXJnICsg
cG9zLCBoYW5kbGUpOwogCiAgICAvLyBUaGUgYWRkcmVzcyBjaGVjayBkb2Vzbid0IG1ha2Ugc2Vu
c2UgaGVyZS4gVGhlIGZvcm1hdCBjaGVjayBjb3VsZCBtYWtlCiAgICAvLyBzZW5zZSBidXQgaXQn
cyBhIGJpdCBvZiBhIHBhaW4uCi0gICBpZiAoc3UtPnRleC5iaW5kbGVzcykKLSAgICAgIHJldHVy
bjsKKyAgIGlmICghc3UtPnRleC5iaW5kbGVzcykgeworICAgICAgLy8gcHJldmVudCByZWFkIGZh
dWx0IHdoZW4gdGhlIGltYWdlIGlzIG5vdCBhY3R1YWxseSBib3VuZAorICAgICAgcHJlZCA9Cisg
ICAgICAgICBibGQubWtDbXAoT1BfU0VULCBDQ19FUSwgVFlQRV9VMzIsIGJsZC5nZXRTU0EoMSwg
RklMRV9QUkVESUNBVEUpLAorICAgICAgICAgICAgICAgICAgIFRZUEVfVTMyLCBibGQubWtJbW0o
MCksCisgICAgICAgICAgICAgICAgICAgbG9hZFN1SW5mbzMyKGluZCwgc2xvdCwgTlZDMF9TVV9J
TkZPX0FERFIsIHN1LT50ZXguYmluZGxlc3MpKTsKKyAgICAgIGlmIChzdS0+b3AgIT0gT1BfU1VT
VFAgJiYgc3UtPnRleC5mb3JtYXQpIHsKKyAgICAgICAgIGNvbnN0IFRleEluc3RydWN0aW9uOjpJ
bWdGb3JtYXREZXNjICpmb3JtYXQgPSBzdS0+dGV4LmZvcm1hdDsKKyAgICAgICAgIGludCBibG9j
a3dpZHRoID0gZm9ybWF0LT5iaXRzWzBdICsgZm9ybWF0LT5iaXRzWzFdICsKKyAgICAgICAgICAg
IGZvcm1hdC0+Yml0c1syXSArIGZvcm1hdC0+Yml0c1szXTsKKworICAgICAgICAgYXNzZXJ0KGZv
cm1hdC0+Y29tcG9uZW50cyAhPSAwKTsKKyAgICAgICAgIC8vIG1ha2Ugc3VyZSB0aGF0IHRoZSBm
b3JtYXQgZG9lc24ndCBtaXNtYXRjaCB3aGVuIGl0J3Mgbm90IEZNVF9OT05FCisgICAgICAgICBi
bGQubWtDbXAoT1BfU0VUX09SLCBDQ19ORSwgVFlQRV9VMzIsIHByZWQtPmdldERlZigwKSwKKyAg
ICAgICAgICAgICAgICAgICBUWVBFX1UzMiwgYmxkLmxvYWRJbW0oTlVMTCwgYmxvY2t3aWR0aCAv
IDgpLAorICAgICAgICAgICAgICAgICAgIGxvYWRTdUluZm8zMihpbmQsIHNsb3QsIE5WQzBfU1Vf
SU5GT19CU0laRSwgc3UtPnRleC5iaW5kbGVzcyksCisgICAgICAgICAgICAgICAgICAgcHJlZC0+
Z2V0RGVmKDApKTsKKyAgICAgIH0KKyAgIH0KIAotICAgLy8gcHJldmVudCByZWFkIGZhdWx0IHdo
ZW4gdGhlIGltYWdlIGlzIG5vdCBhY3R1YWxseSBib3VuZAotICAgQ21wSW5zdHJ1Y3Rpb24gKnBy
ZWQgPQotICAgICAgYmxkLm1rQ21wKE9QX1NFVCwgQ0NfRVEsIFRZUEVfVTMyLCBibGQuZ2V0U1NB
KDEsIEZJTEVfUFJFRElDQVRFKSwKLSAgICAgICAgICAgICAgICBUWVBFX1UzMiwgYmxkLm1rSW1t
KDApLAotICAgICAgICAgICAgICAgIGxvYWRTdUluZm8zMihpbmQsIHNsb3QsIE5WQzBfU1VfSU5G
T19BRERSLCBzdS0+dGV4LmJpbmRsZXNzKSk7Ci0gICBpZiAoc3UtPm9wICE9IE9QX1NVU1RQICYm
IHN1LT50ZXguZm9ybWF0KSB7Ci0gICAgICBjb25zdCBUZXhJbnN0cnVjdGlvbjo6SW1nRm9ybWF0
RGVzYyAqZm9ybWF0ID0gc3UtPnRleC5mb3JtYXQ7Ci0gICAgICBpbnQgYmxvY2t3aWR0aCA9IGZv
cm1hdC0+Yml0c1swXSArIGZvcm1hdC0+Yml0c1sxXSArCi0gICAgICAgICAgICAgICAgICAgICAg
IGZvcm1hdC0+Yml0c1syXSArIGZvcm1hdC0+Yml0c1szXTsKKyAgIC8vIE5vdyB3ZSBoYXZlICJw
cmVkIiB3aGljaCAob3B0aW9uYWxseSkgY29udGFpbnMgd2hldGhlciB0byBkbyB0aGUgc3VyZmFj
ZQorICAgLy8gb3AgYXQgYWxsLCBhbmQgYSAicHJlZDJkIiB3aGljaCBpbmRpY2F0ZXMgdGhhdCwg
aW4gY2FzZSBvZiBkb2luZyB0aGUKKyAgIC8vIHN1cmZhY2Ugb3AsIHdlIGhhdmUgdG8gY3JlYXRl
IGEgMmQgYW5kIDNkIHZlcnNpb24sIGNvbmRpdGlvbmVkIG9uIHByZWQyZC4KKyAgIFRleEluc3Ry
dWN0aW9uICpzdTJkID0gTlVMTDsKKyAgIGlmIChwcmVkMmQpIHsKKyAgICAgIHN1MmQgPSBjbG9u
ZUZvcndhcmQoZnVuYywgc3UpLT5hc1RleCgpOworICAgICAgZm9yICh1bnNpZ25lZCBpID0gMDsg
c3UtPmRlZkV4aXN0cyhpKTsgKytpKQorICAgICAgICAgc3UyZC0+c2V0RGVmKGksIGJsZC5nZXRT
U0EoKSk7CisgICAgICBzdTJkLT5tb3ZlU291cmNlcyhkaW0gKyAxLCAtMSk7CisgICAgICBzdTJk
LT50ZXgudGFyZ2V0ID0gbnY1MF9pcjo6VEVYX1RBUkdFVF8yRDsKKyAgIH0KKyAgIGlmIChwcmVk
MmQgJiYgcHJlZCkgeworICAgICAgSW5zdHJ1Y3Rpb24gKnByZWQzZCA9IGJsZC5ta09wMihPUF9B
TkQsIFRZUEVfVTgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsZC5n
ZXRTU0EoMSwgRklMRV9QUkVESUNBVEUpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwcmVkLT5nZXREZWYoMCksIHByZWQyZC0+Z2V0RGVmKDApKTsKKyAgICAgIHByZWQz
ZC0+c3JjKDApLm1vZCA9IE1vZGlmaWVyKE5WNTBfSVJfTU9EX05PVCk7CisgICAgICBwcmVkM2Qt
PnNyYygxKS5tb2QgPSBNb2RpZmllcihOVjUwX0lSX01PRF9OT1QpOworICAgICAgc3UtPnNldFBy
ZWRpY2F0ZShDQ19QLCBwcmVkM2QtPmdldERlZigwKSk7CisgICAgICBwcmVkMmQgPSBibGQubWtP
cDIoT1BfQU5ELCBUWVBFX1U4LCBibGQuZ2V0U1NBKDEsIEZJTEVfUFJFRElDQVRFKSwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICBwcmVkLT5nZXREZWYoMCksIHByZWQyZC0+Z2V0RGVmKDApKTsK
KyAgICAgIHByZWQyZC0+c3JjKDApLm1vZCA9IE1vZGlmaWVyKE5WNTBfSVJfTU9EX05PVCk7Cisg
ICB9IGVsc2UgaWYgKHByZWQpIHsKKyAgICAgIHN1LT5zZXRQcmVkaWNhdGUoQ0NfTk9UX1AsIHBy
ZWQtPmdldERlZigwKSk7CisgICB9IGVsc2UgaWYgKHByZWQyZCkgeworICAgICAgc3UtPnNldFBy
ZWRpY2F0ZShDQ19OT1RfUCwgcHJlZDJkLT5nZXREZWYoMCkpOworICAgfQorICAgaWYgKHN1MmQp
IHsKKyAgICAgIHN1MmQtPnNldFByZWRpY2F0ZShDQ19QLCBwcmVkMmQtPmdldERlZigwKSk7Cisg
ICAgICBibGQuaW5zZXJ0KHN1MmQpOworCisgICAgICAvLyBDcmVhdGUgYSBVTklPTiBzbyB0aGF0
IFJBIGFzc2lnbnMgdGhlIHNhbWUgcmVnaXN0ZXJzCisgICAgICBibGQuc2V0UG9zaXRpb24oc3Us
IHRydWUpOworICAgICAgZm9yICh1bnNpZ25lZCBpID0gMDsgc3UtPmRlZkV4aXN0cyhpKTsgKytp
KSB7CisgICAgICAgICBhc3NlcnQoaSA8IDQpOwogCi0gICAgICBhc3NlcnQoZm9ybWF0LT5jb21w
b25lbnRzICE9IDApOwotICAgICAgLy8gbWFrZSBzdXJlIHRoYXQgdGhlIGZvcm1hdCBkb2Vzbid0
IG1pc21hdGNoIHdoZW4gaXQncyBub3QgRk1UX05PTkUKLSAgICAgIGJsZC5ta0NtcChPUF9TRVRf
T1IsIENDX05FLCBUWVBFX1UzMiwgcHJlZC0+Z2V0RGVmKDApLAotICAgICAgICAgICAgICAgIFRZ
UEVfVTMyLCBibGQubG9hZEltbShOVUxMLCBibG9ja3dpZHRoIC8gOCksCi0gICAgICAgICAgICAg
ICAgbG9hZFN1SW5mbzMyKGluZCwgc2xvdCwgTlZDMF9TVV9JTkZPX0JTSVpFLCBzdS0+dGV4LmJp
bmRsZXNzKSwKLSAgICAgICAgICAgICAgICBwcmVkLT5nZXREZWYoMCkpOworICAgICAgICAgVmFs
dWVEZWYgJmRlZiA9IHN1LT5kZWYoaSk7CisgICAgICAgICBWYWx1ZURlZiAmZGVmMiA9IHN1MmQt
PmRlZihpKTsKKyAgICAgICAgIEluc3RydWN0aW9uICptb3YgPSBOVUxMOworCisgICAgICAgICBp
ZiAocHJlZCkgeworICAgICAgICAgICAgbW92ID0gYmxkLm1rTW92KGJsZC5nZXRTU0EoKSwgYmxk
LmxvYWRJbW0oTlVMTCwgMCkpOworICAgICAgICAgICAgbW92LT5zZXRQcmVkaWNhdGUoQ0NfUCwg
cHJlZC0+Z2V0RGVmKDApKTsKKyAgICAgICAgIH0KKworICAgICAgICAgSW5zdHJ1Y3Rpb24gKnVu
aSA9IHJldFtpXSA9IGJsZC5ta09wMihPUF9VTklPTiwgVFlQRV9VMzIsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJsZC5nZXRTU0EoKSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTlVMTCwgZGVmMi5nZXQoKSk7CisgICAgICAgICBkZWYucmVw
bGFjZSh1bmktPmdldERlZigwKSwgZmFsc2UpOworICAgICAgICAgdW5pLT5zZXRTcmMoMCwgZGVm
LmdldCgpKTsKKyAgICAgICAgIGlmIChtb3YpCisgICAgICAgICAgICB1bmktPnNldFNyYygyLCBt
b3YtPmdldERlZigwKSk7CisgICAgICB9CisgICB9IGVsc2UgaWYgKHByZWQpIHsKKyAgICAgIC8v
IENyZWF0ZSBhIFVOSU9OIHNvIHRoYXQgUkEgYXNzaWducyB0aGUgc2FtZSByZWdpc3RlcnMKKyAg
ICAgIGJsZC5zZXRQb3NpdGlvbihzdSwgdHJ1ZSk7CisgICAgICBmb3IgKHVuc2lnbmVkIGkgPSAw
OyBzdS0+ZGVmRXhpc3RzKGkpOyArK2kpIHsKKyAgICAgICAgIGFzc2VydChpIDwgNCk7CisKKyAg
ICAgICAgIFZhbHVlRGVmICZkZWYgPSBzdS0+ZGVmKGkpOworCisgICAgICAgICBJbnN0cnVjdGlv
biAqbW92ID0gYmxkLm1rTW92KGJsZC5nZXRTU0EoKSwgYmxkLmxvYWRJbW0oTlVMTCwgMCkpOwor
ICAgICAgICAgbW92LT5zZXRQcmVkaWNhdGUoQ0NfUCwgcHJlZC0+Z2V0RGVmKDApKTsKKworICAg
ICAgICAgSW5zdHJ1Y3Rpb24gKnVuaSA9IHJldFtpXSA9IGJsZC5ta09wMihPUF9VTklPTiwgVFlQ
RV9VMzIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsZC5nZXRTU0Eo
KSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgbW92LT5nZXRE
ZWYoMCkpOworICAgICAgICAgZGVmLnJlcGxhY2UodW5pLT5nZXREZWYoMCksIGZhbHNlKTsKKyAg
ICAgICAgIHVuaS0+c2V0U3JjKDAsIGRlZi5nZXQoKSk7CisgICAgICB9CiAgICB9Ci0gICBzdS0+
c2V0UHJlZGljYXRlKENDX05PVF9QLCBwcmVkLT5nZXREZWYoMCkpOworCisgICByZXR1cm4gc3Uy
ZDsKIH0KIAogdm9pZAogTlZDMExvd2VyaW5nUGFzczo6aGFuZGxlU3VyZmFjZU9wR00xMDcoVGV4
SW5zdHJ1Y3Rpb24gKnN1KQogewotICAgcHJvY2Vzc1N1cmZhY2VDb29yZHNHTTEwNyhzdSk7Cisg
ICAvLyBwcm9jZXNzU3VyZmFjZUNvb3JkcyBhbHNvIHRha2VzIGNhcmUgb2YgZml4aW5nIHVwIHRo
ZSBvdXRwdXRzIGFuZAorICAgLy8gdW5pb24naW5nIHRoZW0gd2l0aCAwIGFzIG5lY2Vzc2FyeS4g
QWRkaXRpb25hbGx5IGl0IG1heSBjcmVhdGUgYSBzZWNvbmQKKyAgIC8vIHN1cmZhY2Ugd2hpY2gg
bmVlZHMgc29tZSBvZiB0aGUgc2ltaWxhciBmaXh1cHMuCisKKyAgIEluc3RydWN0aW9uICpsb2Fk
ZWRbNF0gPSB7fTsKKyAgIFRleEluc3RydWN0aW9uICpzdTIgPSBwcm9jZXNzU3VyZmFjZUNvb3Jk
c0dNMTA3KHN1LCBsb2FkZWQpOwogCiAgICBpZiAoc3UtPm9wID09IE9QX1NVTERQKSB7Ci0gICAg
ICBjb252ZXJ0U3VyZmFjZUZvcm1hdChzdSk7Ci0gICAgICBpbnNlcnRPT0JTdXJmYWNlT3BSZXN1
bHQoc3UpOworICAgICAgY29udmVydFN1cmZhY2VGb3JtYXQoc3UsIGxvYWRlZCk7CiAgICB9CiAK
ICAgIGlmIChzdS0+b3AgPT0gT1BfU1VSRURQKSB7Ci0gICAgICBWYWx1ZSAqZGVmID0gc3UtPmdl
dERlZigwKTsKLQogICAgICAgc3UtPm9wID0gT1BfU1VSRURCOworICAgfQogCi0gICAgICAvLyBU
aGVyZSBtYXkgbm90IGJlIGEgcHJlZGljYXRlIGluIHRoZSBiaW5kbGVzcyBjYXNlLgotICAgICAg
aWYgKHN1LT5nZXRQcmVkaWNhdGUoKSkgewotICAgICAgICAgc3UtPnNldERlZigwLCBibGQuZ2V0
U1NBKCkpOwotCi0gICAgICAgICBibGQuc2V0UG9zaXRpb24oc3UsIHRydWUpOwotCi0gICAgICAg
ICAvLyBtYWtlIHN1cmUgdG8gaW5pdGlhbGl6ZSBkc3QgdmFsdWUgd2hlbiB0aGUgYXRvbWljIG9w
ZXJhdGlvbiBpcyBub3QKLSAgICAgICAgIC8vIHBlcmZvcm1lZAotICAgICAgICAgSW5zdHJ1Y3Rp
b24gKm1vdiA9IGJsZC5ta01vdihibGQuZ2V0U1NBKCksIGJsZC5sb2FkSW1tKE5VTEwsIDApKTsK
LQotICAgICAgICAgYXNzZXJ0KHN1LT5jYyA9PSBDQ19OT1RfUCk7Ci0gICAgICAgICBtb3YtPnNl
dFByZWRpY2F0ZShDQ19QLCBzdS0+Z2V0UHJlZGljYXRlKCkpOwotCi0gICAgICAgICBibGQubWtP
cDIoT1BfVU5JT04sIFRZUEVfVTMyLCBkZWYsIHN1LT5nZXREZWYoMCksIG1vdi0+Z2V0RGVmKDAp
KTsKLSAgICAgIH0KKyAgIC8vIElmIHdlIGZpeGVkIHVwIHRoZSB0eXBlIG9mIHRoZSByZWd1bGFy
IHN1cmZhY2UgbG9hZCBpbnN0cnVjdGlvbiwgd2UgYWxzbworICAgLy8gaGF2ZSB0byBmaXggdXAg
dGhlIGNvcHkuCisgICBpZiAoc3UyKSB7CisgICAgICBzdTItPm9wID0gc3UtPm9wOworICAgICAg
c3UyLT5kVHlwZSA9IHN1LT5kVHlwZTsKKyAgICAgIHN1Mi0+c1R5cGUgPSBzdS0+c1R5cGU7CiAg
ICB9CiB9CiAKZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2Vu
L252NTBfaXJfbG93ZXJpbmdfbnZjMC5oIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2Nv
ZGVnZW4vbnY1MF9pcl9sb3dlcmluZ19udmMwLmgKaW5kZXggMGNlMmE0YjgwZjguLmI0YzQwNWE5
ZWE1IDEwMDY0NAotLS0gYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUw
X2lyX2xvd2VyaW5nX252YzAuaAorKysgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29k
ZWdlbi9udjUwX2lyX2xvd2VyaW5nX252YzAuaApAQCAtMTcxLDEwICsxNzEsMTAgQEAgcHJpdmF0
ZToKICAgIFZhbHVlICpsb2FkTXNJbmZvMzIoVmFsdWUgKnB0ciwgdWludDMyX3Qgb2ZmKTsKIAog
ICAgdm9pZCBhZGp1c3RDb29yZGluYXRlc01TKFRleEluc3RydWN0aW9uICopOwotICAgdm9pZCBw
cm9jZXNzU3VyZmFjZUNvb3Jkc0dNMTA3KFRleEluc3RydWN0aW9uICopOworICAgVGV4SW5zdHJ1
Y3Rpb24gKnByb2Nlc3NTdXJmYWNlQ29vcmRzR00xMDcoVGV4SW5zdHJ1Y3Rpb24gKiwgSW5zdHJ1
Y3Rpb24gKls0XSk7CiAgICB2b2lkIHByb2Nlc3NTdXJmYWNlQ29vcmRzTlZFNChUZXhJbnN0cnVj
dGlvbiAqKTsKICAgIHZvaWQgcHJvY2Vzc1N1cmZhY2VDb29yZHNOVkMwKFRleEluc3RydWN0aW9u
ICopOwotICAgdm9pZCBjb252ZXJ0U3VyZmFjZUZvcm1hdChUZXhJbnN0cnVjdGlvbiAqKTsKKyAg
IHZvaWQgY29udmVydFN1cmZhY2VGb3JtYXQoVGV4SW5zdHJ1Y3Rpb24gKiwgSW5zdHJ1Y3Rpb24g
KiopOwogICAgdm9pZCBpbnNlcnRPT0JTdXJmYWNlT3BSZXN1bHQoVGV4SW5zdHJ1Y3Rpb24gKik7
CiAgICBWYWx1ZSAqY2FsY3VsYXRlU2FtcGxlT2Zmc2V0KFZhbHVlICpzYW1wbGVJRCk7CiAKZGlm
ZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9udmMwL252YzBfdGV4LmMgYi9z
cmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvbnZjMC9udmMwX3RleC5jCmluZGV4IGY2MmU1MDgy
NThiLi40OTQ4YThmNGNlYSAxMDA2NDQKLS0tIGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1
L252YzAvbnZjMF90ZXguYworKysgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvbnZjMC9u
dmMwX3RleC5jCkBAIC0xNDMzLDcgKzE0MzMsMTUgQEAgZ20xMDdfY3JlYXRlX2ltYWdlX2hhbmRs
ZShzdHJ1Y3QgcGlwZV9jb250ZXh0ICpwaXBlLAogCiAgICBudmMwLT5zY3JlZW4tPnRpYy5sb2Nr
W3RpYy0+aWQgLyAzMl0gfD0gMSA8PCAodGljLT5pZCAlIDMyKTsKIAotICAgcmV0dXJuIDB4MTAw
MDAwMDAwVUxMIHwgdGljLT5pZDsKKyAgIC8vIENvbXB1dGUgaGFuZGxlLiBUaGlzIHdpbGwgaW5j
bHVkZSB0aGUgVElDIGFzIHdlbGwgYXMgc29tZSBhZGRpdGlvbmFsCisgICAvLyBpbmZvIHJlZ2Fy
ZGluZyB0aGUgYm91bmQgM2Qgc3VyZmFjZSBsYXllciwgaWYgYXBwbGljYWJsZS4KKyAgIHVpbnQ2
NF90IGhhbmRsZSA9IDB4MTAwMDAwMDAwVUxMIHwgdGljLT5pZDsKKyAgIHN0cnVjdCBudjA0X3Jl
c291cmNlICpyZXMgPSBudjA0X3Jlc291cmNlKHZpZXctPnJlc291cmNlKTsKKyAgIGlmIChyZXMt
PmJhc2UudGFyZ2V0ID09IFBJUEVfVEVYVFVSRV8zRCkgeworICAgICAgaGFuZGxlIHw9IDEgPDwg
MTE7CisgICAgICBoYW5kbGUgfD0gdmlldy0+dS50ZXguZmlyc3RfbGF5ZXIgPDwgKDExICsgMTYp
OworICAgfQorICAgcmV0dXJuIGhhbmRsZTsKIAogZmFpbDoKICAgIEZSRUUodGljKTsKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
