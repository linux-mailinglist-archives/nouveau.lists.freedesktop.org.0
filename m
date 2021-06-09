Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425553A0D4A
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 09:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323A86E235;
	Wed,  9 Jun 2021 07:10:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54ED46E20E;
 Wed,  9 Jun 2021 07:10:55 +0000 (UTC)
Received: from [192.168.1.3] (ns.gsystem.sk [62.176.172.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 8496D7A025C;
 Wed,  9 Jun 2021 09:10:54 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Date: Wed, 9 Jun 2021 09:10:51 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <202106090857.42133.linux@zary.sk>
 <1c4a7360-57e3-c75a-c729-1432db5b90b9@amd.com>
In-Reply-To: <1c4a7360-57e3-c75a-c729-1432db5b90b9@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202106090910.51188.linux@zary.sk>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL
 pointer dereference in nouveau_bo_sync_for_device
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5IDA5IEp1bmUgMjAyMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAw
OS4wNi4yMSB1bSAwODo1NyBzY2hyaWViIE9uZHJlaiBaYXJ5Ogo+ID4gW1NOSVBdCj4gPj4gVGhh
bmtzIGZvciB0aGUgaGVhZHMgdXAuIFNvIHRoZSBwcm9ibGVtIHdpdGggbXkgcGF0Y2ggaXMgYWxy
ZWFkeSBmaXhlZCwKPiA+PiBpc24ndCBpdD8KPiA+IFRoZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2UgaW4gbm91dmVhdV9ib193cjE2IGludHJvZHVjZWQgaW4KPiA+IDE0MWIxNWU1OTE3NWFhMTc0
Y2ExZjc1OTYxODhiZDE1YTdjYTE3YmEgd2FzIGZpeGVkIGJ5Cj4gPiBhZWE2NTZiMGQwNWVjNWI4
ZWQ1YmViMmY5NGM0ZGQ0MmVhODM0ZTlkLgo+ID4KPiA+IFRoYXQncyB0aGUgYnVnIEkgaGl0IHdo
ZW4gYmlzZWN0aW5nIHRoZSBvcmlnaW5hbCBwcm9ibGVtOgo+ID4gTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGluIG5vdXZlYXVfYm9fc3luY19mb3JfZGV2aWNlCj4gPiBJdCdzIGNhdXNlZCBieToK
PiA+ICMgZmlyc3QgYmFkIGNvbW1pdDogW2UzNGI4ZmVlYWE0YjY1NzI1YjI1ZjQ5YzliMDhhMGY4
NzA3ZThlODZdIGRybS90dG06IG1lcmdlIHR0bV9kbWFfdHQgYmFjayBpbnRvIHR0bV90dAo+IAo+
IEdvb2QgdGhhdCBJJ3ZlIGFza2VkIDopCj4gCj4gT2sgdGhhdCdzIGEgYml0IHN0cmFuZ2UuIGUz
NGI4ZmVlYWE0YjY1NzI1YjI1ZjQ5YzliMDhhMGY4NzA3ZThlODYgd2FzIAo+IGNyZWF0ZWQgbW9z
dGx5IGF1dG9tYXRlZC4KPiAKPiBEbyB5b3UgaGF2ZSB0aGUgb3JpZ2luYWwgYmFja3RyYWNlIG9m
IHRoYXQgTlVMTCBwb2ludGVyIGRlcmVmIG9uY2UgbW9yZT8KClRoZSBvcmlnaW5hbCBiYWNrdHJh
Y2UgaXMgaGVyZTogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvNi81LzM1MAoKLS0gCk9uZHJl
aiBaYXJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
