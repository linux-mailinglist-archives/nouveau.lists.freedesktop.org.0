Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97546325231
	for <lists+nouveau@lfdr.de>; Thu, 25 Feb 2021 16:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E2B6E1B7;
	Thu, 25 Feb 2021 15:19:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737FB6E14D;
 Thu, 25 Feb 2021 11:38:11 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmW2l0pD6z16CZf;
 Thu, 25 Feb 2021 19:36:31 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 19:37:58 +0800
From: Luo Jiaxing <luojiaxing@huawei.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <bskeggs@redhat.com>
Date: Thu, 25 Feb 2021 19:38:52 +0800
Message-ID: <1614253132-21793-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 25 Feb 2021 15:19:47 +0000
Subject: [Nouveau] [PATCH v1] drm/nouveau/device: append a NUL-terminated
 character for the string which filled by strncpy()
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
Cc: luojiaxing@huawei.com, linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rm9sbG93aW5nIHdhcm5pbmcgaXMgZm91bmQgd2hlbiB1c2luZyBXPTEgdG8gYnVpbGQga2VybmVs
OgoKSW4gZnVuY3Rpb24g4oCYbnZrbV91ZGV2aWNlX2luZm/igJksCiAgICBpbmxpbmVkIGZyb20g
4oCYbnZrbV91ZGV2aWNlX210aGTigJkgYXQgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9l
bmdpbmUvZGV2aWNlL3VzZXIuYzoxOTU6MTA6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZW5naW5lL2RldmljZS91c2VyLmM6MTY0OjI6IHdhcm5pbmc6IOKAmHN0cm5jcHnigJkgc3BlY2lm
aWVkIGJvdW5kIDE2IGVxdWFscyBkZXN0aW5hdGlvbiBzaXplIFstV3N0cmluZ29wLXRydW5jYXRp
b25dCiAgMTY0IHwgIHN0cm5jcHkoYXJncy0+djAuY2hpcCwgZGV2aWNlLT5jaGlwLT5uYW1lLCBz
aXplb2YoYXJncy0+djAuY2hpcCkpOwpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2lu
ZS9kZXZpY2UvdXNlci5jOjE2NToyOiB3YXJuaW5nOiDigJhzdHJuY3B54oCZIHNwZWNpZmllZCBi
b3VuZCA2NCBlcXVhbHMgZGVzdGluYXRpb24gc2l6ZSBbLVdzdHJpbmdvcC10cnVuY2F0aW9uXQog
IDE2NSB8ICBzdHJuY3B5KGFyZ3MtPnYwLm5hbWUsIGRldmljZS0+bmFtZSwgc2l6ZW9mKGFyZ3Mt
PnYwLm5hbWUpKTsKClRoZSByZWFzb24gb2YgdGhpcyB3YXJuaW5nIGlzIHN0cm5jcHkoKSBkb2Vz
IG5vdCBndWFyYW50ZWUgdGhhdCB0aGUKZGVzdGluYXRpb24gYnVmZmVyIHdpbGwgYmUgTlVMIHRl
cm1pbmF0ZWQuIElmIHRoZSBsZW5ndGggb2Ygc291cmNlIHN0cmluZwppcyBiaWdnZXIgdGhhbiBu
dW1iZXIgd2Ugc2V0IGJ5IHRoaXJkIGlucHV0IHBhcmFtZXRlciwgb25seSBmaXJzdCBbbnVtYmVy
XQpvZiBjaGFyYWN0ZXJzIGlzIGNvcGllZCB0byB0aGUgZGVzdGluYXRpb24sIGFuZCBubyBOVUwt
dGVybWluYXRlZCBpcwphdXRvbWF0aWNhbGx5IGFkZGVkLiBUaGVyZSBhcmUgc29tZSBwb3RlbnRp
YWwgcmlza3MuCgpTaWduZWQtb2ZmLWJ5OiBMdW8gSmlheGluZyA8bHVvamlheGluZ0BodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS91c2Vy
LmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9k
ZXZpY2UvdXNlci5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNl
L3VzZXIuYwppbmRleCBmZWE5ZDhmLi4yYTMyZmUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdXNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS91c2VyLmMKQEAgLTE2MSw4ICsxNjEsMTAgQEAg
bnZrbV91ZGV2aWNlX2luZm8oc3RydWN0IG52a21fdWRldmljZSAqdWRldiwgdm9pZCAqZGF0YSwg
dTMyIHNpemUpCiAJaWYgKGltZW0gJiYgYXJncy0+djAucmFtX3NpemUgPiAwKQogCQlhcmdzLT52
MC5yYW1fdXNlciA9IGFyZ3MtPnYwLnJhbV91c2VyIC0gaW1lbS0+cmVzZXJ2ZWQ7CiAKLQlzdHJu
Y3B5KGFyZ3MtPnYwLmNoaXAsIGRldmljZS0+Y2hpcC0+bmFtZSwgc2l6ZW9mKGFyZ3MtPnYwLmNo
aXApKTsKLQlzdHJuY3B5KGFyZ3MtPnYwLm5hbWUsIGRldmljZS0+bmFtZSwgc2l6ZW9mKGFyZ3Mt
PnYwLm5hbWUpKTsKKwlzdHJuY3B5KGFyZ3MtPnYwLmNoaXAsIGRldmljZS0+Y2hpcC0+bmFtZSwg
c2l6ZW9mKGFyZ3MtPnYwLmNoaXApIC0gMSk7CisJYXJncy0+djAuY2hpcFtzaXplb2YoYXJncy0+
djAuY2hpcCkgLSAxXSA9ICdcMCc7CisJc3RybmNweShhcmdzLT52MC5uYW1lLCBkZXZpY2UtPm5h
bWUsIHNpemVvZihhcmdzLT52MC5uYW1lKSAtIDEpOworCWFyZ3MtPnYwLm5hbWVbc2l6ZW9mKGFy
Z3MtPnYwLm5hbWUpIC0gMV0gPSAnXDAnOwogCXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
