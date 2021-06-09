Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12B13A1DE8
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 22:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADCF6EA9F;
	Wed,  9 Jun 2021 20:00:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id D92136EA94;
 Wed,  9 Jun 2021 20:00:12 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id B87917A025C;
 Wed,  9 Jun 2021 22:00:10 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Date: Wed, 9 Jun 2021 22:00:07 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <202106090910.51188.linux@zary.sk>
 <762c1044-6e3a-48fc-95e4-1730b6ef2a2e@amd.com>
In-Reply-To: <762c1044-6e3a-48fc-95e4-1730b6ef2a2e@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202106092200.08088.linux@zary.sk>
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

T24gV2VkbmVzZGF5IDA5IEp1bmUgMjAyMSAxMToyMTowNSBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IEFtIDA5LjA2LjIxIHVtIDA5OjEwIHNjaHJpZWIgT25kcmVqIFphcnk6Cj4gPiBPbiBXZWRu
ZXNkYXkgMDkgSnVuZSAyMDIxLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4+IEFtIDA5LjA2
LjIxIHVtIDA4OjU3IHNjaHJpZWIgT25kcmVqIFphcnk6Cj4gPj4+IFtTTklQXQo+ID4+Pj4gVGhh
bmtzIGZvciB0aGUgaGVhZHMgdXAuIFNvIHRoZSBwcm9ibGVtIHdpdGggbXkgcGF0Y2ggaXMgYWxy
ZWFkeSBmaXhlZCwKPiA+Pj4+IGlzbid0IGl0Pwo+ID4+PiBUaGUgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGluIG5vdXZlYXVfYm9fd3IxNiBpbnRyb2R1Y2VkIGluCj4gPj4+IDE0MWIxNWU1OTE3
NWFhMTc0Y2ExZjc1OTYxODhiZDE1YTdjYTE3YmEgd2FzIGZpeGVkIGJ5Cj4gPj4+IGFlYTY1NmIw
ZDA1ZWM1YjhlZDViZWIyZjk0YzRkZDQyZWE4MzRlOWQuCj4gPj4+Cj4gPj4+IFRoYXQncyB0aGUg
YnVnIEkgaGl0IHdoZW4gYmlzZWN0aW5nIHRoZSBvcmlnaW5hbCBwcm9ibGVtOgo+ID4+PiBOVUxM
IHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gbm91dmVhdV9ib19zeW5jX2Zvcl9kZXZpY2UKPiA+Pj4g
SXQncyBjYXVzZWQgYnk6Cj4gPj4+ICMgZmlyc3QgYmFkIGNvbW1pdDogW2UzNGI4ZmVlYWE0YjY1
NzI1YjI1ZjQ5YzliMDhhMGY4NzA3ZThlODZdIGRybS90dG06IG1lcmdlIHR0bV9kbWFfdHQgYmFj
ayBpbnRvIHR0bV90dAo+ID4+IEdvb2QgdGhhdCBJJ3ZlIGFza2VkIDopCj4gPj4KPiA+PiBPayB0
aGF0J3MgYSBiaXQgc3RyYW5nZS4gZTM0YjhmZWVhYTRiNjU3MjViMjVmNDljOWIwOGEwZjg3MDdl
OGU4NiB3YXMKPiA+PiBjcmVhdGVkIG1vc3RseSBhdXRvbWF0ZWQuCj4gPj4KPiA+PiBEbyB5b3Ug
aGF2ZSB0aGUgb3JpZ2luYWwgYmFja3RyYWNlIG9mIHRoYXQgTlVMTCBwb2ludGVyIGRlcmVmIG9u
Y2UgbW9yZT8KPiA+IFRoZSBvcmlnaW5hbCBiYWNrdHJhY2UgaXMgaGVyZTogaHR0cHM6Ly9uYW0x
MS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGtt
bC5vcmclMkZsa21sJTJGMjAyMSUyRjYlMkY1JTJGMzUwJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJp
c3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2U5MDViNmJkMmFhODQyYWNlMTU1MDhkOTJiMTViOTZk
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzU4ODE5NTAw
MDcyOTQ2MCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJ
am9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0
YT16RnFoZUJiSmNPSHRZZ3FHJTJGczYzQVQxZHd1azRSRW1VREpXSHZ6YUxBbGMlM0QmYW1wO3Jl
c2VydmVkPTAKPiAKPiBBbmQgdGhlIHByb2JsZW0gaXMgdGhhdCB0dG1fZG1hLT5kbWFfYWRkcmVz
cyBpcyBOVUxMLCByaWdodD8gTWhtLCBJIAo+IGRvbid0IHNlZSBob3cgdGhhdCBjYW4gaGFwcGVu
IHNpbmNlIG5vdXZlYXUgaXMgdXNpbmcgdHRtX3NnX3R0X2luaXQoKS4KPiAKPiBBcGFydCBmcm9t
IHRoYXQgd2hhdCBub3V2ZWF1IGRvZXMgaGVyZSBpcyByYXRoZXIgcXVlc3Rpb25hYmxlIHNpbmNl
IHlvdSAKPiBuZWVkIGEgY29oZXJlbnQgYXJjaGl0ZWN0dXJlIGZvciBtb3N0IHRoaW5ncyBhbnl3
YXksIGJ1dCB0aGF0J3Mgbm90IHdoYXQgCj4gd2UgYXJlIHRyeWluZyB0byBmaXggaGVyZS4KPiAK
PiBDYW4geW91IHRyeSB0byBuYXJyb3cgZG93biBpZiB0dG1fc2dfdHRfaW5pdCBpcyBjYWxsZWQg
YmVmb3JlIGNhbGxpbmcgCj4gdGhpcyBmdW5jdGlvbiBmb3IgdGhlIHR0IG9iamVjdCBpbiBxdWVz
dGlvbj8KCnR0bV9zZ190dF9pbml0IGlzIG5vdCBjYWxsZWQ6ClsgICAxMi4xNTAxMjRdIG5vdXZl
YXUgMDAwMDowMTowMC4wOiBEUk06IFZSQU06IDMxIE1pQgpbICAgMTIuMTUwMTMzXSBub3V2ZWF1
IDAwMDA6MDE6MDAuMDogRFJNOiBHQVJUOiAxMjggTWlCClsgICAxMi4xNTAxNDNdIG5vdXZlYXUg
MDAwMDowMTowMC4wOiBEUk06IEJNUCB2ZXJzaW9uIDUuNgpbICAgMTIuMTUwMTUxXSBub3V2ZWF1
IDAwMDA6MDE6MDAuMDogRFJNOiBObyBEQ0IgZGF0YSBmb3VuZCBpbiBWQklPUwpbICAgMTIuMTUx
MzYyXSB0dG1fdHRfaW5pdApbICAgMTIuMTUxMzcwXSB0dG1fdHRfaW5pdF9maWVsZHMKWyAgIDEy
LjE1MTM3NF0gdHRtX3R0X2FsbG9jX3BhZ2VfZGlyZWN0b3J5ClsgICAxMi4xNTE2MTVdIEJVRzog
a2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAKCgoKLS0g
Ck9uZHJlaiBaYXJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
