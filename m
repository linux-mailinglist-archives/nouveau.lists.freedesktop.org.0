Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4BA968F36
	for <lists+nouveau@lfdr.de>; Mon,  2 Sep 2024 23:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB1810E3C5;
	Mon,  2 Sep 2024 21:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="BeoFydXY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDD710E3C5
 for <nouveau@lists.freedesktop.org>; Mon,  2 Sep 2024 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1725313656; x=1725572856;
 bh=DNkwhlc6gaWAyeMkwa5e66XZ1vRY8kYw1U5lqBpgHbs=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=BeoFydXY5mBfY1h+7lHnhoDNbUlB/Av/IF7ELVfrWu89+C0MKZaEtnfNH5BjRbYC5
 qq3EluvpHyl1wMYd1+Hyeep0wpgM+0YOCVwGrv5CJQ2XLZ/+5KNWSixDmPkp+aVKZB
 9MoN2APdqWmoJi3cTaOPU8fa9LDqvBz2B/yuc1/GQiQcoC2ngZ7zVHleeT49n7clSh
 jTVnLkinam3AylBh+BGDpG7XqwDGlsLkqmb6v+4YBfY7KA+xs4MLtR0Mf21PLaFrNr
 w3HwKHEEe14IRsrXnSrngaMQS56cUUKjT4bh7ID151CyNm90kEaZnSV2aqv7vHEJOW
 sPyPVfulYx4QA==
Date: Mon, 02 Sep 2024 21:47:30 +0000
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Subject: Noveau Driver NVIDIA wake from standby display activation issues
Message-ID: <hpYjNlX_UjYhAbw9YwXxb4dVebVe3l9swxEjHunmDJP7r1_sZ52CzAtIL_0IHu4kKUTQiDTfOrhZW5P2IHpDYjrccgEA5WbHBG5oQZxe-a8=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 1d527180a610f467482a10e134e3f91a29b26e72
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_I7Glhh8KralNC0PMpaoHPPCxzfw1XMlxw9zOdJI"
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--b1_I7Glhh8KralNC0PMpaoHPPCxzfw1XMlxw9zOdJI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksClR1cm5pbmcgb2ZmIGEgY29ubmVjdGVkIFRWLCBhbmQgdGhlbiB0dXJuaW5nIGl0IG9uIGNh
dXNlcyBpc3N1ZXMgd2l0aCByZS1uZWdvdGlhdGluZyBhIGNvbm5lY3Rpb24gdG8gdGhlIGRpc3Bs
YXkuCgpUaGUgZXJyb3IgbWVzc2FnZSB3YXMgcGFzdGVkIGludG8gYW4gb3BlbiBkb2N1bWVudCB0
aGF0IHdhcyBhY3RpdmVseSB1bmRlciBlZGl0IHdpdGggdGhlIHByb2dyYW0gbmFuby4gSSBhc3N1
bWUgbWVzc2FnZXMgYXJlIHNlbnQgZnJvbSBzb21ld2hlcmUgZGVzdGluZWQgZm9yIHN0ZG91dDsg
b3Igc29tZXRoaW5nIGhhcyByZWRpcmVjdGVkIGl0LiBFaXRoZXIgd2F5LCBJIHRoaW5rIHRoaXMg
bWF5IGNhdXNlIGlzc3VlcyB3aXRoIGJ1ZyByZXBvcnRzLiBJdCBsb29rcyBsaWtlIGEgZG1lc2cg
ZW50cnkuCgpUaGUgZXJyb3Igd2FzICdbaWRdIG5vdmVhdSAwMDAwOjBiOjAwLjA6IERSTTogRERD
IHJlc3BvbmRlZCwgYnV0IG5vIEVESUQgZm9yIEhETUktQS0xJwoKUG9zc2libHkgYW4gaXNzdWUg
cGFyc2luZyBFRElEIGluZm9ybWF0aW9uLCBvciB0aGlzIGRpc3BsYXkgYm90Y2hlcyBzZW5kaW5n
IEVESUQgaW5mb3JtYXRpb24uCgpSdW5uaW5nIERlYmlhbiAxMiBCb29rd29ybSBpbiBtdWx0aS11
c2VyIG1vZGUsIGRpc3BsYXkgZGV2aWNlIGlzIE5WSURJQSBSVFggMzA2MFRpLCBkaXNwbGF5IGlz
IExHIEMzIE9MRUQgcnVubmluZyBvbiBvdXRkYXRlZCBmaXJtd2FyZS4gSSBhbSB1bmNlcnRhaW4g
aWYgdXBkYXRpbmcgdGhlIGRpc3BsYXkgZmlybXdhcmUgd291bGQgZml4IHRoZSBpc3N1ZSwgYW5k
IEkgaGF2ZSBubyBhY2Nlc3MgdG8gdXAtdG8tZGF0ZSBmaXJtd2FyZS4KCkZlZWwgZnJlZSB0byBh
c2sgYW55IHF1ZXN0aW9ucy4KClJlZ2FyZHMsClN1bm55NzNjcg==

--b1_I7Glhh8KralNC0PMpaoHPPCxzfw1XMlxw9zOdJI
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij5IaSw8YnI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyI+VHVybmluZyBvZmYgYSBjb25uZWN0ZWQgVFYsIGFu
ZCB0aGVuIHR1cm5pbmcgaXQgb24gY2F1c2VzIGlzc3VlcyB3aXRoIHJlLW5lZ290aWF0aW5nIGEg
Y29ubmVjdGlvbiB0byB0aGUgZGlzcGxheS48YnI+PGJyPlRoZSBlcnJvciBtZXNzYWdlIHdhcyBw
YXN0ZWQgaW50byBhbiBvcGVuIGRvY3VtZW50IHRoYXQgd2FzIGFjdGl2ZWx5IHVuZGVyIGVkaXQg
d2l0aCB0aGUgcHJvZ3JhbSBuYW5vLiBJIGFzc3VtZSBtZXNzYWdlcyBhcmUgc2VudCBmcm9tIHNv
bWV3aGVyZSBkZXN0aW5lZCBmb3Igc3Rkb3V0OyBvciBzb21ldGhpbmcgaGFzIHJlZGlyZWN0ZWQg
aXQuIEVpdGhlciB3YXksIEkgdGhpbmsgdGhpcyBtYXkgY2F1c2UgaXNzdWVzIHdpdGggYnVnIHJl
cG9ydHMuIEl0IGxvb2tzIGxpa2UgYSBkbWVzZyBlbnRyeS48YnI+PGJyPlRoZSBlcnJvciB3YXMg
J1tpZF0gbm92ZWF1IDAwMDA6MGI6MDAuMDogRFJNOiBEREMgcmVzcG9uZGVkLCBidXQgbm8gRURJ
RCBmb3IgSERNSS1BLTEnPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1p
bHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7Ij5Qb3NzaWJseSBhbiBpc3N1
ZSBwYXJzaW5nIEVESUQgaW5mb3JtYXRpb24sIG9yIHRoaXMgZGlzcGxheSBib3RjaGVzIHNlbmRp
bmcgRURJRCBpbmZvcm1hdGlvbi48YnI+PGJyPlJ1bm5pbmcgRGViaWFuIDEyIEJvb2t3b3JtIGlu
IG11bHRpLXVzZXIgbW9kZSwgZGlzcGxheSBkZXZpY2UgaXMgTlZJRElBIFJUWCAzMDYwVGksIGRp
c3BsYXkgaXMgTEcgQzMgT0xFRCBydW5uaW5nIG9uIG91dGRhdGVkIGZpcm13YXJlLiBJIGFtIHVu
Y2VydGFpbiBpZiB1cGRhdGluZyB0aGUgZGlzcGxheSBmaXJtd2FyZSB3b3VsZCBmaXggdGhlIGlz
c3VlLCBhbmQgSSBoYXZlIG5vIGFjY2VzcyB0byB1cC10by1kYXRlIGZpcm13YXJlLjxicj48YnI+
RmVlbCBmcmVlIHRvIGFzayBhbnkgcXVlc3Rpb25zLjxicj48YnI+UmVnYXJkcyw8L2Rpdj48ZGl2
IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsi
PlN1bm55NzNjcjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIiBz
dHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7Ij4N
CjwvZGl2Pg0K


--b1_I7Glhh8KralNC0PMpaoHPPCxzfw1XMlxw9zOdJI--

