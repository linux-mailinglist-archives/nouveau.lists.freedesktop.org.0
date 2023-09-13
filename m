Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C274F7B2E12
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 10:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A2510E6E2;
	Fri, 29 Sep 2023 08:42:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 09:19:31 UTC
Received: from cstnet.cn (smtp20.cstnet.cn [159.226.251.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECFE10E48F;
 Wed, 13 Sep 2023 09:19:31 +0000 (UTC)
Received: from sunying$isrc.iscas.ac.cn ( [180.111.102.117] ) by
 ajax-webmail-APP-10 (Coremail) ; Wed, 13 Sep 2023 17:11:50 +0800
 (GMT+08:00)
X-Originating-IP: [180.111.102.117]
Date: Wed, 13 Sep 2023 17:11:50 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: sunying@isrc.iscas.ac.cn
To: airlied@gmail.com, daniel@ffwll.ch
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230321(1bf45b10)
 Copyright (c) 2002-2023 www.mailtech.cn cnic.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <501c0133.60683.18a8dcfa512.Coremail.sunying@isrc.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowAD3_1_WfAFlSG4KAA--.54825W
X-CM-SenderInfo: 5vxq5x1qj6x21ufox2xfdvhtffof0/1tbiCgUNCmUBThuxbAAAsk
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:42:15 +0000
Subject: [Nouveau] drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bit.c and bus.c
 with a series of the non-existing config "NOUVEAU_I2C_INTERNAL"
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
Cc: nouveau@lists.freedesktop.org, renyanjie01@gmail.com, pengpeng@iscas.ac.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SW4gdGhlIHNvdXJjZSBmaWxlcyBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9p
MmMvYml0LmM6MjYgYW5kCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pMmMv
YnVzLmM6MjE0IHJlZmVyIHRvCiBjb25maWd1cmF0aW9uIG9wdGlvbnMgIkNPTkZJR19OT1VWRUFV
X0kyQ19JTlRFUk5BTCIgYW5kIAoiQ09ORklHX05PVVZFQVVfSTJDX0lOVEVSTkFMX0RFRkFVTFQi
IGZvciBjb25kaXRpb25hbCBjb21waWxhdGlvbiwKYnV0IHRoZXNlIGNvbmZpZ3VyYXRpb24gb3B0
aW9ucyBhcmUgbm90IGRlZmluZWQgaW4gYW55IGtjb25maWcgZmlsZXMsCndoaWNoIG1lYW5zIHRo
ZSAiI2lmZGVmIENPTkZJR19OT1VWRUFVX0kyQ19JTlRFUk5BTF94eHgiIGNvbmRpdGlvbiBjb250
YWlucyBkZWFkIGNvZGUuCgpEbyB0aGVzZSBjb25maWd1cmF0aW9uIG9wdGlvbnMgbmVlZCB0byBi
ZSByZXRhaW5lZCBhbmQgYWRkZWQgbGF0ZXI/CiBPciBjYW4gd2Ugc2ltcGx5IGRyb3AgdGhlIGRl
YWQgY29kZT8KCgpCZXN0IHJlZ2FyZHMsCllhbmppZSBSZW4KWWluZyBTdW4KCgo=
