Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13AA256CA
	for <lists+nouveau@lfdr.de>; Tue, 21 May 2019 19:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C38944A;
	Tue, 21 May 2019 17:35:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7938944A
 for <nouveau@lists.freedesktop.org>; Tue, 21 May 2019 17:35:52 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id 9so5977861itf.4
 for <nouveau@lists.freedesktop.org>; Tue, 21 May 2019 10:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1nXaMnBFt1KwObW8xApc/HszKilUAUKJ0yiW2/5eyOQ=;
 b=VHybPPBfXBFUihTHMUkZV8E3TK2chsiGYCcTo6cd4Te3K9TdnJEHaJeHs7NNHl4T7H
 G/u2oajhY+PqxNta6gkhbvpJmAOsU5vPR9uorl6I9Patz9WuQ0tf+Jw8qOaKoLB3sy7V
 TpLKVsyLPG8MB7MISiIpkVd9RuCFg+CGFtrAOKfUHV0XE7X9tnb7uQlb4IdZ3w68paEi
 l+0ituirZaHC1XQ573Htjt0NBGXJiA5fSH1xsEpEkGW/W2dG+hpHS87wsjw5FFZKE96f
 YlBG2DcfrKW/yKUBJ1pAsdXnGZdbBa3+Jk7bYNEaD3woD1eS95K7J8ZObuSmxkXFK4Qm
 ZGng==
X-Gm-Message-State: APjAAAU3zeVyYjLCa2b2i8q11hJDXMM6Lgs4D2tIJIbmF6ldBLRu45BF
 kZEQJ4jIpuU+4/gMA17uomDJUwpUmt7MAB9phM2qVg==
X-Google-Smtp-Source: APXvYqy1zlUCo1U6ly0lN4nuNF71x1oeCP1aNx+RA0kj3LaP1kF44OXD0I6AP7sQpaIncMeQ9i60RdIWd6gE0l5F64U=
X-Received: by 2002:a02:cabb:: with SMTP id e27mr2778500jap.12.1558460151218; 
 Tue, 21 May 2019 10:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190507201245.9295-1-kherbst@redhat.com>
 <20190507201245.9295-5-kherbst@redhat.com>
 <20190520211933.GA57618@google.com>
 <CACO55tsHi+4gRMC=XqOypJttztKNe5oKxxk0eqEVxGZoMzS+4Q@mail.gmail.com>
 <20190521131033.GC57618@google.com>
 <CACO55ts=u7aZ1uZYJ4eMZPvSycwYpzr-W6Xn8oDBLrxsivLOAw@mail.gmail.com>
 <20190521141317.GD57618@google.com>
 <CACO55tvVzugMpFFNbnxgsfkXNXcN-PqoaXkjWHL0et=fAcThhg@mail.gmail.com>
In-Reply-To: <CACO55tvVzugMpFFNbnxgsfkXNXcN-PqoaXkjWHL0et=fAcThhg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 21 May 2019 19:35:40 +0200
Message-ID: <CACO55tv2nnAxNAr=DTd2EzQXmQ5KLT1TR04J+WhVsnkV2_gBnw@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [Nouveau] [PATCH v2 4/4] pci: save the boot pcie link speed and
 restore it on fini
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

d2FzIGFibGUgdG8gZ2V0IHRoZSBsc3BjaSBwcmludHMgdmlhIHNzaC4gTWFjaGluZSByZWJvb3Rl
ZAphdXRvbWF0aWNhbGx5IGVhY2ggdGltZSB0aG91Z2guCgpyZWxldmFudCBkbWVzZzoKa2VybmVs
OiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogUmVmdXNlZCB0byBjaGFuZ2UgcG93ZXIgc3RhdGUsIGN1
cnJlbnRseSBpbiBEMwprZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBSZWZ1c2VkIHRvIGNo
YW5nZSBwb3dlciBzdGF0ZSwgY3VycmVudGx5IGluIEQzCmtlcm5lbDogbm91dmVhdSAwMDAwOjAx
OjAwLjA6IFJlZnVzZWQgdG8gY2hhbmdlIHBvd2VyIHN0YXRlLCBjdXJyZW50bHkgaW4gRDMKa2Vy
bmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogdG1yOiBzdGFsbGVkIGF0IGZmZmZmZmZmZmZmZmZm
ZmYKCihsYXN0IG9uZSBpcyBhIDY0IGJpdCBtbWlvIHJlYWQgdG8gZ2V0IHRoZSBvbiBHUFUgdGlt
ZXIgdmFsdWUpCgojIGxzcGNpIC12dnh4eCAtcyAwOjAxLjAwCjAwOjAxLjAgUENJIGJyaWRnZTog
SW50ZWwgQ29ycG9yYXRpb24gWGVvbiBFMy0xMjAwIHY1L0UzLTE1MDAgdjUvNnRoCkdlbiBDb3Jl
IFByb2Nlc3NvciBQQ0llIENvbnRyb2xsZXIgKHgxNikgKHJldiAwNSkgKHByb2ctaWYgMDAgW05v
cm1hbApkZWNvZGVdKQogICAgICAgQ29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3RlcisgU3BlY0N5
Y2xlLSBNZW1XSU5WLSBWR0FTbm9vcC0KUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0g
RGlzSU5UeC0KICAgICAgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnIt
IERFVlNFTD1mYXN0ID5UQWJvcnQtCjxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5U
eC0KICAgICAgIExhdGVuY3k6IDAKICAgICAgIEludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElS
USAxNgogICAgICAgQnVzOiBwcmltYXJ5PTAwLCBzZWNvbmRhcnk9MDEsIHN1Ym9yZGluYXRlPTAx
LCBzZWMtbGF0ZW5jeT0wCiAgICAgICBJL08gYmVoaW5kIGJyaWRnZTogMDAwMGUwMDAtMDAwMGVm
ZmYgW3NpemU9NEtdCiAgICAgICBNZW1vcnkgYmVoaW5kIGJyaWRnZTogZWMwMDAwMDAtZWQwZmZm
ZmYgW3NpemU9MTdNXQogICAgICAgUHJlZmV0Y2hhYmxlIG1lbW9yeSBiZWhpbmQgYnJpZGdlOgow
MDAwMDAwMGMwMDAwMDAwLTAwMDAwMDAwZDFmZmZmZmYgW3NpemU9Mjg4TV0KICAgICAgIFNlY29u
ZGFyeSBzdGF0dXM6IDY2TUh6LSBGYXN0QjJCLSBQYXJFcnItIERFVlNFTD1mYXN0ID5UQWJvcnQt
CjxUQWJvcnQtIDxNQWJvcnQrIDxTRVJSLSA8UEVSUi0KICAgICAgIEJyaWRnZUN0bDogUGFyaXR5
LSBTRVJSLSBOb0lTQS0gVkdBLSBWR0ExNisgTUFib3J0LSA+UmVzZXQtIEZhc3RCMkItCiAgICAg
ICAgICAgICAgIFByaURpc2NUbXItIFNlY0Rpc2NUbXItIERpc2NUbXJTdGF0LSBEaXNjVG1yU0VS
UkVuLQogICAgICAgQ2FwYWJpbGl0aWVzOiBbODhdIFN1YnN5c3RlbTogRGVsbCBEZXZpY2UgMDdi
ZQogICAgICAgQ2FwYWJpbGl0aWVzOiBbODBdIFBvd2VyIE1hbmFnZW1lbnQgdmVyc2lvbiAzCiAg
ICAgICAgICAgICAgIEZsYWdzOiBQTUVDbGstIERTSS0gRDEtIEQyLSBBdXhDdXJyZW50PTBtQQpQ
TUUoRDArLEQxLSxEMi0sRDNob3QrLEQzY29sZCspCiAgICAgICAgICAgICAgIFN0YXR1czogRDAg
Tm9Tb2Z0UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQogICAgICAgQ2FwYWJp
bGl0aWVzOiBbOTBdIE1TSTogRW5hYmxlLSBDb3VudD0xLzEgTWFza2FibGUtIDY0Yml0LQogICAg
ICAgICAgICAgICBBZGRyZXNzOiAwMDAwMDAwMCAgRGF0YTogMDAwMAogICAgICAgQ2FwYWJpbGl0
aWVzOiBbYTBdIEV4cHJlc3MgKHYyKSBSb290IFBvcnQgKFNsb3QrKSwgTVNJIDAwCiAgICAgICAg
ICAgICAgIERldkNhcDogTWF4UGF5bG9hZCAyNTYgYnl0ZXMsIFBoYW50RnVuYyAwCiAgICAgICAg
ICAgICAgICAgICAgICAgRXh0VGFnLSBSQkUrCiAgICAgICAgICAgICAgIERldkN0bDogQ29yckVy
ci0gTm9uRmF0YWxFcnItIEZhdGFsRXJyLSBVbnN1cFJlcS0KICAgICAgICAgICAgICAgICAgICAg
ICBSbHhkT3JkLSBFeHRUYWctIFBoYW50RnVuYy0gQXV4UHdyLSBOb1Nub29wLQogICAgICAgICAg
ICAgICAgICAgICAgIE1heFBheWxvYWQgMjU2IGJ5dGVzLCBNYXhSZWFkUmVxIDEyOCBieXRlcwog
ICAgICAgICAgICAgICBEZXZTdGE6IENvcnJFcnItIE5vbkZhdGFsRXJyLSBGYXRhbEVyci0gVW5z
dXBSZXEtCkF1eFB3ci0gVHJhbnNQZW5kLQogICAgICAgICAgICAgICBMbmtDYXA6IFBvcnQgIzIs
IFNwZWVkIDhHVC9zLCBXaWR0aCB4MTYsIEFTUE0gTDBzIEwxLApFeGl0IExhdGVuY3kgTDBzIDwy
NTZucywgTDEgPDh1cwogICAgICAgICAgICAgICAgICAgICAgIENsb2NrUE0tIFN1cnByaXNlLSBM
TEFjdFJlcC0gQndOb3QrIEFTUE1PcHRDb21wKwogICAgICAgICAgICAgICBMbmtDdGw6IEFTUE0g
RGlzYWJsZWQ7IFJDQiA2NCBieXRlcyBEaXNhYmxlZC0gQ29tbUNsaysKICAgICAgICAgICAgICAg
ICAgICAgICBFeHRTeW5jaC0gQ2xvY2tQTS0gQXV0V2lkRGlzLSBCV0ludC0gQXV0QldJbnQtCiAg
ICAgICAgICAgICAgIExua1N0YTogU3BlZWQgMi41R1QvcyAoZG93bmdyYWRlZCksIFdpZHRoIHgx
NiAob2spCiAgICAgICAgICAgICAgICAgICAgICAgVHJFcnItIFRyYWluLSBTbG90Q2xrKyBETEFj
dGl2ZS0gQldNZ210KyBBQldNZ210KwogICAgICAgICAgICAgICBTbHRDYXA6IEF0dG5CdG4tIFB3
ckN0cmwtIE1STC0gQXR0bkluZC0gUHdySW5kLQpIb3RQbHVnLSBTdXJwcmlzZS0KICAgICAgICAg
ICAgICAgICAgICAgICBTbG90ICMxLCBQb3dlckxpbWl0IDc1LjAwMFc7IEludGVybG9jay0gTm9D
b21wbCsKICAgICAgICAgICAgICAgU2x0Q3RsOiBFbmFibGU6IEF0dG5CdG4tIFB3ckZsdC0gTVJM
LSBQcmVzRGV0LSBDbWRDcGx0LQpIUElycS0gTGlua0NoZy0KICAgICAgICAgICAgICAgICAgICAg
ICBDb250cm9sOiBBdHRuSW5kIFVua25vd24sIFB3ckluZCBVbmtub3duLApQb3dlci0gSW50ZXJs
b2NrLQogICAgICAgICAgICAgICBTbHRTdGE6IFN0YXR1czogQXR0bkJ0bi0gUG93ZXJGbHQtIE1S
TC0gQ21kQ3BsdC0KUHJlc0RldC0gSW50ZXJsb2NrLQogICAgICAgICAgICAgICAgICAgICAgIENo
YW5nZWQ6IE1STC0gUHJlc0RldCsgTGlua1N0YXRlLQogICAgICAgICAgICAgICBSb290Q3RsOiBF
cnJDb3JyZWN0YWJsZS0gRXJyTm9uLUZhdGFsLSBFcnJGYXRhbC0KUE1FSW50RW5hLSBDUlNWaXNp
YmxlLQogICAgICAgICAgICAgICBSb290Q2FwOiBDUlNWaXNpYmxlLQogICAgICAgICAgICAgICBS
b290U3RhOiBQTUUgUmVxSUQgMDAwMCwgUE1FU3RhdHVzLSBQTUVQZW5kaW5nLQogICAgICAgICAg
ICAgICBEZXZDYXAyOiBDb21wbGV0aW9uIFRpbWVvdXQ6IE5vdCBTdXBwb3J0ZWQsClRpbWVvdXRE
aXMtLCBMVFIrLCBPQkZGIFZpYSBXQUtFIyBBUklGd2QtCiAgICAgICAgICAgICAgICAgICAgICAg
IEF0b21pY09wc0NhcDogUm91dGluZy0gMzJiaXQrIDY0Yml0KyAxMjhiaXRDQVMrCiAgICAgICAg
ICAgICAgIERldkN0bDI6IENvbXBsZXRpb24gVGltZW91dDogNTB1cyB0byA1MG1zLCBUaW1lb3V0
RGlzLSwKTFRSKywgT0JGRiBWaWEgV0FLRSMgQVJJRndkLQogICAgICAgICAgICAgICAgICAgICAg
ICBBdG9taWNPcHNDdGw6IFJlcUVuLSBFZ3Jlc3NCbGNrLQogICAgICAgICAgICAgICBMbmtDdGwy
OiBUYXJnZXQgTGluayBTcGVlZDogOEdUL3MsIEVudGVyQ29tcGxpYW5jZS0gU3BlZWREaXMtCiAg
ICAgICAgICAgICAgICAgICAgICAgIFRyYW5zbWl0IE1hcmdpbjogTm9ybWFsIE9wZXJhdGluZyBS
YW5nZSwKRW50ZXJNb2RpZmllZENvbXBsaWFuY2UtIENvbXBsaWFuY2VTT1MtCiAgICAgICAgICAg
ICAgICAgICAgICAgIENvbXBsaWFuY2UgRGUtZW1waGFzaXM6IC02ZEIKICAgICAgICAgICAgICAg
TG5rU3RhMjogQ3VycmVudCBEZS1lbXBoYXNpcyBMZXZlbDogLTZkQiwKRXF1YWxpemF0aW9uQ29t
cGxldGUtLCBFcXVhbGl6YXRpb25QaGFzZTEtCiAgICAgICAgICAgICAgICAgICAgICAgIEVxdWFs
aXphdGlvblBoYXNlMi0sIEVxdWFsaXphdGlvblBoYXNlMy0sCkxpbmtFcXVhbGl6YXRpb25SZXF1
ZXN0LQogICAgICAgQ2FwYWJpbGl0aWVzOiBbMTAwIHYxXSBWaXJ0dWFsIENoYW5uZWwKICAgICAg
ICAgICAgICAgQ2FwczogICBMUEVWQz0wIFJlZkNsaz0xMDBucyBQQVRFbnRyeUJpdHM9MQogICAg
ICAgICAgICAgICBBcmI6ICAgIEZpeGVkLSBXUlIzMi0gV1JSNjQtIFdSUjEyOC0KICAgICAgICAg
ICAgICAgQ3RybDogICBBcmJTZWxlY3Q9Rml4ZWQKICAgICAgICAgICAgICAgU3RhdHVzOiBJblBy
b2dyZXNzLQogICAgICAgICAgICAgICBWQzA6ICAgIENhcHM6ICAgUEFUT2Zmc2V0PTAwIE1heFRp
bWVTbG90cz0xIFJlalNub29wVHJhbnMtCiAgICAgICAgICAgICAgICAgICAgICAgQXJiOiAgICBG
aXhlZCsgV1JSMzItIFdSUjY0LSBXUlIxMjgtIFRXUlIxMjgtIFdSUjI1Ni0KICAgICAgICAgICAg
ICAgICAgICAgICBDdHJsOiAgIEVuYWJsZSsgSUQ9MCBBcmJTZWxlY3Q9Rml4ZWQgVEMvVkM9ZmYK
ICAgICAgICAgICAgICAgICAgICAgICBTdGF0dXM6IE5lZ29QZW5kaW5nKyBJblByb2dyZXNzLQog
ICAgICAgQ2FwYWJpbGl0aWVzOiBbMTQwIHYxXSBSb290IENvbXBsZXggTGluawogICAgICAgICAg
ICAgICBEZXNjOiAgIFBvcnROdW1iZXI9MDIgQ29tcG9uZW50SUQ9MDEgRWx0VHlwZT1Db25maWcK
ICAgICAgICAgICAgICAgTGluazA6ICBEZXNjOiAgIFRhcmdldFBvcnQ9MDAgVGFyZ2V0Q29tcG9u
ZW50PTAxCkFzc29jUkNSQi0gTGlua1R5cGU9TWVtTWFwcGVkIExpbmtWYWxpZCsKICAgICAgICAg
ICAgICAgICAgICAgICBBZGRyOiAgIDAwMDAwMDAwZmVkMTkwMDAKICAgICAgIENhcGFiaWxpdGll
czogW2Q5NCB2MV0gU2Vjb25kYXJ5IFBDSSBFeHByZXNzIDw/PgogICAgICAgS2VybmVsIGRyaXZl
ciBpbiB1c2U6IHBjaWVwb3J0CjAwOiA4NiA4MCAwMSAxOSAwNyAwMCAxMCAwMCAwNSAwMCAwNCAw
NiAwMCAwMCA4MSAwMAoxMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDEgMDEgMDAgZTAg
ZTAgMDAgMjAKMjA6IDAwIGVjIDAwIGVkIDAxIGMwIGYxIGQxIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwCjMwOiAwMCAwMCAwMCAwMCA4OCAwMCAwMCAwMCAwMCAwMCAwMCAwMCBmZiAwMSAxMCAwMAo0
MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAKNTA6IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCjYwOiAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMAo3MDogMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgNjIgMTcgMDAgMDAgMDAgMDAgMGEKODA6IDAxIDkwIDAzIGM4IDA4IDAw
IDAwIDAwIDBkIDgwIDAwIDAwIDI4IDEwIGJlIDA3CjkwOiAwNSBhMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMAphMDogMTAgMDAgNDIgMDEgMDEgODAgMDAgMDAgMjAg
MDAgMDAgMDAgMDMgYWQgNjEgMDIKYjA6IDQwIDAwIDAxIGQxIDgwIDI1IDBjIDAwIDAwIDAwIDA4
IDAwIDAwIDAwIDAwIDAwCmMwOiAwMCAwMCAwMCAwMCA4MCAwYiAwOCAwMCAwMCA2NCAwMCAwMCAw
ZSAwMCAwMCAwMApkMDogNDMgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAKZTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
CmYwOiAwMCA0MCAwMSAwMCA0ZSAwMSAwMSAyMiAwMCAwMCAwMCAwMCBlMCAwMCAxMCAwMAoKbHNw
Y2kgLXZ2eHh4IC1zIDE6MDAuMDAKMDE6MDAuMCAzRCBjb250cm9sbGVyOiBOVklESUEgQ29ycG9y
YXRpb24gR1AxMDdNIFtHZUZvcmNlIEdUWCAxMDUwCk1vYmlsZV0gKHJldiBmZikgKHByb2ctaWYg
ZmYpCiAgICAgICAhISEgVW5rbm93biBoZWFkZXIgdHlwZSA3ZgogICAgICAgS2VybmVsIGRyaXZl
ciBpbiB1c2U6IG5vdXZlYXUKICAgICAgIEtlcm5lbCBtb2R1bGVzOiBub3V2ZWF1CjAwOiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgoxMDogZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKMjA6IGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCjMwOiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgo0MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKNTA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmCjYwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZgo3MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYKODA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmCjkwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgph
MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKYjA6IGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCmMwOiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgpkMDogZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKZTA6IGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCmYwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgoKT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgNDozMCBQ
TSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1h
eSAyMSwgMjAxOSBhdCA0OjEzIFBNIEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDM6Mjg6NDhQTSArMDIwMCwg
S2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAzOjExIFBN
IEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gT24gVHVl
LCBNYXkgMjEsIDIwMTkgYXQgMTI6MzA6MzhBTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+
ID4gPiA+ID4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6MjAgUE0gQmpvcm4gSGVsZ2FhcyA8
aGVsZ2Fhc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+ID4gT24gVHVlLCBNYXkgMDcsIDIw
MTkgYXQgMTA6MTI6NDVQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+ID4gPiA+
IEFwcGVyYW50bHkgdGhpbmdzIGdvIHNvdXRoIGlmIHdlIHN1c3BlbmQgdGhlIGRldmljZSB3aXRo
IGEgZGlmZmVyZW50IFBDSUUKPiA+ID4gPiA+ID4gPiBsaW5rIHNwZWVkIHNldCB0aGFuIGl0IGdv
dCBib290ZWQgd2l0aC4gRml4ZXMgcnVudGltZSBzdXNwZW5kIG9uIG15IGdwMTA3Lgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhpcyBhbGwgbG9va3MgbGlrZSBzb21lIGJ1ZyBpbnNpZGUg
dGhlIHBjaSBzdWJzeXN0ZW0gYW5kIEkgd291bGQgcHJlZmVyIGEKPiA+ID4gPiA+ID4gPiBmaXgg
dGhlcmUgaW5zdGVhZCBvZiBub3V2ZWF1LCBidXQgbWF5YmUgdGhlcmUgaXMgbm8gcmVhbCBuaWNl
IHdheSBvZiBkb2luZwo+ID4gPiA+ID4gPiA+IHRoYXQgb3V0c2lkZSBvZiBkcml2ZXJzPwo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBJIGFncmVlIGl0IHdvdWxkIGJlIG5pY2UgdG8gZml4IHRoaXMg
aW4gdGhlIFBDSSBjb3JlIGlmIHRoYXQncwo+ID4gPiA+ID4gPiBmZWFzaWJsZS4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gSXQgbG9va3MgbGlrZSB0aGlzIGRyaXZlciBjaGFuZ2VzIHRoZSBQQ0ll
IGxpbmsgc3BlZWQgdXNpbmcgc29tZQo+ID4gPiA+ID4gPiBkZXZpY2Utc3BlY2lmaWMgbWVjaGFu
aXNtLiAgV2hlbiB3ZSBzdXNwZW5kLCB3ZSBwdXQgdGhlIGRldmljZSBpbgo+ID4gPiA+ID4gPiBE
M2NvbGQsIHNvIGl0IGxvc2VzIGFsbCBpdHMgc3RhdGUuICBXaGVuIHdlIHJlc3VtZSwgdGhlIGxp
bmsgcHJvYmFibHkKPiA+ID4gPiA+ID4gY29tZXMgdXAgYXQgdGhlIGJvb3Qgc3BlZWQgYmVjYXVz
ZSBub3RoaW5nIGRpZCB0aGF0IGRldmljZS1zcGVjaWZpYwo+ID4gPiA+ID4gPiBtYWdpYyB0byBj
aGFuZ2UgaXQsIHNvIHlvdSBwcm9iYWJseSBlbmQgdXAgd2l0aCB0aGUgbGluayBiZWluZyBzbG93
Cj4gPiA+ID4gPiA+IGJ1dCB0aGUgZHJpdmVyIHRoaW5raW5nIGl0J3MgY29uZmlndXJlZCB0byBi
ZSBmYXN0LCBhbmQgbWF5YmUgdGhhdAo+ID4gPiA+ID4gPiBjb21iaW5hdGlvbiBkb2Vzbid0IHdv
cmsuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IElmIGl0IHJlcXVpcmVzIHNvbWV0aGluZyBkZXZp
Y2Utc3BlY2lmaWMgdG8gY2hhbmdlIHRoYXQgbGluayBzcGVlZCwgSQo+ID4gPiA+ID4gPiBkb24n
dCBrbm93IGhvdyB0byBwdXQgdGhhdCBpbiB0aGUgUENJIGNvcmUuICBCdXQgbWF5YmUgSSdtIG1p
c3NpbmcKPiA+ID4gPiA+ID4gc29tZXRoaW5nPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBQZXIg
dGhlIFBDSWUgc3BlYyAocjQuMCwgc2VjIDEuMik6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAg
SW5pdGlhbGl6YXRpb24g4oCTIER1cmluZyBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiwgZWFjaCBQ
Q0kgRXhwcmVzcwo+ID4gPiA+ID4gPiAgIExpbmsgaXMgc2V0IHVwIGZvbGxvd2luZyBhIG5lZ290
aWF0aW9uIG9mIExhbmUgd2lkdGhzIGFuZCBmcmVxdWVuY3kKPiA+ID4gPiA+ID4gICBvZiBvcGVy
YXRpb24gYnkgdGhlIHR3byBhZ2VudHMgYXQgZWFjaCBlbmQgb2YgdGhlIExpbmsuIE5vIGZpcm13
YXJlCj4gPiA+ID4gPiA+ICAgb3Igb3BlcmF0aW5nIHN5c3RlbSBzb2Z0d2FyZSBpcyBpbnZvbHZl
ZC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBoYXZlIGJlZW4gYXNzdW1pbmcgdGhhdCB0aGlz
IG1lYW5zIGRldmljZS1zcGVjaWZpYyBsaW5rIHNwZWVkCj4gPiA+ID4gPiA+IG1hbmFnZW1lbnQg
aXMgb3V0IG9mIHNwZWMsIGJ1dCBpdCBzZWVtcyBwcmV0dHkgY29tbW9uIHRoYXQgZGV2aWNlcwo+
ID4gPiA+ID4gPiBkb24ndCBjb21lIHVwIGJ5IHRoZW1zZWx2ZXMgYXQgdGhlIGZhc3Rlc3QgcG9z
c2libGUgbGluayBzcGVlZC4gIFNvCj4gPiA+ID4gPiA+IG1heWJlIHRoZSBzcGVjIGp1c3QgaW50
ZW5kcyB0aGF0IGRldmljZXMgY2FuIG9wZXJhdGUgYXQgKnNvbWUqIHZhbGlkCj4gPiA+ID4gPiA+
IHNwZWVkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgd291bGQgZXhwZWN0IHRoYXQgZGV2aWNlcyBr
aW5kIG9mIGhhdmUgdG8gZmlndXJlIG91dCB3aGF0IHRoZXkgY2FuCj4gPiA+ID4gPiBvcGVyYXRl
IG9uIGFuZCB0aGUgb3BlcmF0aW5nIHN5c3RlbSBraW5kIG9mIGp1c3QgY2hlY2tzIHdoYXQgdGhl
Cj4gPiA+ID4gPiBjdXJyZW50IHN0YXRlIGlzIGFuZCBkb2Vzbid0IHRyeSB0byAicmVzdG9yZSIg
dGhlIG9sZCBzdGF0ZSBvcgo+ID4gPiA+ID4gc29tZXRoaW5nPwo+ID4gPiA+Cj4gPiA+ID4gVGhl
IGRldmljZXMgYXQgZWFjaCBlbmQgb2YgdGhlIGxpbmsgbmVnb3RpYXRlIHRoZSB3aWR0aCBhbmQg
c3BlZWQgb2YKPiA+ID4gPiB0aGUgbGluay4gIFRoaXMgaXMgZG9uZSBkaXJlY3RseSBieSB0aGUg
aGFyZHdhcmUgd2l0aG91dCBhbnkgaGVscCBmcm9tCj4gPiA+ID4gdGhlIE9TLgo+ID4gPiA+Cj4g
PiA+ID4gVGhlIE9TIGNhbiByZWFkIHRoZSBjdXJyZW50IGxpbmsgc3RhdGUgKEN1cnJlbnQgTGlu
ayBTcGVlZCBhbmQKPiA+ID4gPiBOZWdvdGlhdGVkIExpbmsgV2lkdGgsIGJvdGggaW4gdGhlIExp
bmsgU3RhdHVzIHJlZ2lzdGVyKS4gIFRoZSBPUyBoYXMKPiA+ID4gPiB2ZXJ5IGxpdHRsZSBjb250
cm9sIG92ZXIgdGhhdCBzdGF0ZS4gIEl0IGNhbid0IGRpcmVjdGx5IHJlc3RvcmUgdGhlCj4gPiA+
ID4gc3RhdGUgYmVjYXVzZSB0aGUgaGFyZHdhcmUgaGFzIHRvIG5lZ290aWF0ZSBhIHdpZHRoICYg
c3BlZWQgdGhhdAo+ID4gPiA+IHJlc3VsdCBpbiByZWxpYWJsZSBvcGVyYXRpb24uCj4gPiA+ID4K
PiA+ID4gPiA+IFdlIGRvbid0IGRvIGFueXRoaW5nIGluIHRoZSBkcml2ZXIgYWZ0ZXIgdGhlIGRl
dmljZSB3YXMgc3VzcGVuZGVkLiBBbmQKPiA+ID4gPiA+IHRoZSAweDg4MDAwIGlzIGEgbWlycm9y
IG9mIHRoZSBQQ0kgY29uZmlnIHNwYWNlLCBidXQgd2UgYWxzbyBnb3Qgc29tZQo+ID4gPiA+ID4g
UENJZSBzdHVmZiBhdCAweDhjMDAwIHdoaWNoIGlzIHVzZWQgYnkgbmV3ZXIgR1BVcyBmb3IgZ2Vu
MyBzdHVmZgo+ID4gPiA+ID4gZXNzZW50aWFsbHkuIEkgaGF2ZSBubyBpZGVhIGhvdyBtdWNoIG9m
IHRoaXMgaXMgcGFydCBvZiB0aGUgYWN0dWFsIHBjaQo+ID4gPiA+ID4gc3RhbmRhcmQgYW5kIGhv
dyBtdWNoIGlzIGRyaXZlciBzcGVjaWZpYy4gQnV0IHRoZSBkcml2ZXIgYWxzbyB3YW50cyB0bwo+
ID4gPiA+ID4gaGF2ZSBzb21lIGNvbnRyb2wgb3ZlciB0aGUgbGluayBzcGVlZCBhcyBpdCdzIHRp
Z2h0IHRvIHBlcmZvcm1hbmNlCj4gPiA+ID4gPiBzdGF0ZXMgb24gR1BVLgo+ID4gPiA+Cj4gPiA+
ID4gQXMgZmFyIGFzIEknbSBhd2FyZSwgdGhlcmUgaXMgbm8gZ2VuZXJpYyBQQ0llIHdheSBmb3Ig
dGhlIE9TIHRvCj4gPiA+ID4gaW5mbHVlbmNlIHRoZSBsaW5rIHdpZHRoIG9yIHNwZWVkLiAgSWYg
dGhlIEdQVSBkcml2ZXIgbmVlZHMgdG8gZG8KPiA+ID4gPiB0aGF0LCBpdCB3b3VsZCBiZSB2aWEg
c29tZSBkZXZpY2Utc3BlY2lmaWMgbWVjaGFuaXNtLgo+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgYmln
IGlzc3VlIGhlcmUgaXMganVzdCwgdGhhdCB0aGUgR1BVIGJvb3RzIHdpdGggOC4wLCBzb21lIG9u
LWdwdQo+ID4gPiA+ID4gaW5pdCBtZWNoYW5pc20gZGVjcmVhc2VzIGl0IHRvIDIuNS4gSWYgd2Ug
c3VzcGVuZCwgdGhlIEdQVSBvciBhdCBsZWFzdAo+ID4gPiA+ID4gdGhlIGNvbW11bmljYXRpb24g
d2l0aCB0aGUgY29udHJvbGxlciBpcyBicm9rZW4uIEJ1dCBpZiB3ZSBzZXQgaXQgdG8KPiA+ID4g
PiA+IHRoZSBib290IHNwZWVkLCByZXN1bWluZyB0aGUgR1BVIGp1c3Qgd29ya3MuIFNvIG15IGFz
c3VtcHRpb24gd2FzLAo+ID4gPiA+ID4gdGhhdCBfc29tZXRoaW5nXyAobWlnaHQgaXQgYmUgdGhl
IGNvbnRyb2xsZXIgb3IgdGhlIHBjaSBzdWJzeXN0ZW0pCj4gPiA+ID4gPiB0cmllcyB0byBmb3Jj
ZSB0byBvcGVyYXRlIG9uIGFuIGludmFsaWQgbGluayBzcGVlZCBhbmQgYmVjYXVzZSB0aGUKPiA+
ID4gPiA+IGJyaWRnZSBjb250cm9sbGVyIGlzIGFjdHVhbGx5IHBvd2VyZWQgZG93biBhcyB3ZWxs
IChhcyBhbGwgY2hpbGRyZW4KPiA+ID4gPiA+IGFyZSBpbiBEM2NvbGQpIEkgY291bGQgaW1hZ2lu
ZSB0aGF0IHNvbWV0aGluZyBpbiB0aGUgcGNpIHN1YnN5c3RlbQo+ID4gPiA+ID4gYWN0dWFsbHkg
cmVzdG9yZXMgdGhlIHN0YXRlIHdoaWNoIGxldHMgdGhlIGNvbnRyb2xsZXIgZmFpbCB0bwo+ID4g
PiA+ID4gZXN0YWJsaXNoIGNvbW11bmljYXRpb24gYWdhaW4/Cj4gPiA+ID4KPiA+ID4gPiAgIDEp
IEF0IGJvb3QtdGltZSwgdGhlIFBvcnQgYW5kIHRoZSBHUFUgaGFyZHdhcmUgbmVnb3RpYXRlIDgu
MCBHVC9zCj4gPiA+ID4gICAgICB3aXRob3V0IE9TL2RyaXZlciBpbnRlcnZlbnRpb24uCj4gPiA+
ID4KPiA+ID4gPiAgIDIpIFNvbWUgbWVjaGFuaXNtIHJlZHVjZXMgbGluayBzcGVlZCB0byAyLjUg
R1Qvcy4gIFRoaXMgcHJvYmFibHkKPiA+ID4gPiAgICAgIHJlcXVpcmVzIGRyaXZlciBpbnRlcnZl
bnRpb24gb3IgYXQgbGVhc3Qgc29tZSBBQ1BJIG1ldGhvZC4KPiA+ID4KPiA+ID4gdGhlcmUgaXMg
bm8gZHJpdmVyIGludGVydmVudGlvbiBhbmQgTm91dmVhdSBkb2Vzbid0IGNhcmUgYXQgYWxsLiBJ
dCdzCj4gPiA+IGFsbCBkb25lIG9uIHRoZSBHUFUuIFdlIGp1c3QgdXBsb2FkIGEgc2NyaXB0IGFu
ZCBzb21lIGZpcm13YXJlIG9uIHRvCj4gPiA+IHRoZSBHUFUuIFRoZSBzY3JpcHQgcnVucyB0aGVu
IG9uIHRoZSBQTVUgaW5zaWRlIHRoZSBHUFUgYW5kIHRoaXMKPiA+ID4gc2NyaXB0IGFsc28gY2F1
c2VzIGNoYW5naW5nIHRoZSBQQ0llIGxpbmsgc2V0dGluZ3MuIEJ1dCBmcm9tIGEgTm91dmVhdQo+
ID4gPiBwb2ludCBvZiB2aWV3IHdlIGRvbid0IGNhcmUgYWJvdXQgdGhlIGxpbmsgYmVmb3JlIG9y
IGFmdGVyIHRoYXQgc2NyaXB0Cj4gPiA+IHdhcyBpbnZva2VkLiBBbHNvIHRoZXJlIGlzIG5vIEFD
UEkgbWV0aG9kIGludm9sdmVkLgo+ID4gPgo+ID4gPiBCdXQgaWYgdGhlcmUgaXMgc29tZXRoaW5n
IHdlIHNob3VsZCBub3RpZnkgcGNpIGNvcmUgYWJvdXQsIG1heWJlCj4gPiA+IHRoYXQncyBzb21l
dGhpbmcgd2UgaGF2ZSB0byBkbyB0aGVuPwo+ID4KPiA+IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBh
bnl0aGluZyB0aGUgUENJIGNvcmUgY291bGQgZG8gd2l0aCB0aGF0Cj4gPiBpbmZvcm1hdGlvbiBh
bnl3YXkuICBUaGUgUENJIGNvcmUgZG9lc24ndCBjYXJlIGF0IGFsbCBhYm91dCB0aGUgbGluawo+
ID4gc3BlZWQsIGFuZCBpdCByZWFsbHkgY2FuJ3QgaW5mbHVlbmNlIGl0IGRpcmVjdGx5Lgo+ID4K
PiA+ID4gPiAgIDMpIFN1c3BlbmQgcHV0cyBHUFUgaW50byBEM2NvbGQgKHBvd2VyZWQgb2ZmKS4K
PiA+ID4gPgo+ID4gPiA+ICAgNCkgUmVzdW1lIHJlc3RvcmVzIEdQVSB0byBEMCwgYW5kIHRoZSBQ
b3J0IGFuZCBHUFUgaGFyZHdhcmUgYWdhaW4KPiA+ID4gPiAgICAgIG5lZ290aWF0ZSA4LjAgR1Qv
cyB3aXRob3V0IE9TL2RyaXZlciBpbnRlcnZlbnRpb24sIGp1c3QgbGlrZSBhdAo+ID4gPiA+ICAg
ICAgaW5pdGlhbCBib290Lgo+ID4gPgo+ID4gPiBObywgdGhhdCBuZWdvdGlhdGlvbiBmYWlscyBh
cHBhcmVudGx5IGFzIGFueSBhdHRlbXB0IHRvIHJlYWQgYW55dGhpbmcKPiA+ID4gZnJvbSB0aGUg
ZGV2aWNlIGp1c3QgZmFpbHMgaW5zaWRlIHBjaSBjb3JlLiBPciBzb21ldGhpbmcgZ29lcyB3cm9u
Zwo+ID4gPiB3aGVuIHJlc3VtaW5nIHRoZSBicmlkZ2UgY29udHJvbGxlci4KPiA+Cj4gPiBJJ20g
c3VycHJpc2VkIHRoZSBuZWdvdGlhdGlvbiB3b3VsZCBmYWlsIGV2ZW4gYWZ0ZXIgYSBwb3dlciBj
eWNsZSBvZgo+ID4gdGhlIGRldmljZS4gIEJ1dCBpZiB5b3UgY2FuIGF2b2lkIHRoZSBpc3N1ZSBi
eSBydW5uaW5nIGFub3RoZXIgc2NyaXB0Cj4gPiBvbiB0aGUgUE1VIGJlZm9yZSBzdXNwZW5kLCB0
aGF0J3MgcHJvYmFibHkgd2hhdCB5b3UnbGwgaGF2ZSB0byBkby4KPiA+Cj4KPiB0aGVyZSBpcyBu
b25lIGFzIGZhciBhcyB3ZSBrbm93LiBPciBhdCBsZWFzdCBub3RoaW5nIGluc2lkZSB0aGUgdmJp
b3MuCj4gV2Ugc3RpbGwgaGF2ZSB0byBnZXQgc2lnbmVkIFBNVSBmaXJtd2FyZSBpbWFnZXMgZnJv
bSBOdmlkaWEgZm9yIGZ1bGwKPiBzdXBwb3J0LCBidXQgdGhpcyBzdGlsbCB3b3VsZCBiZSBhIGhh
Y2t5IGlzc3VlIGFzIHdlIHdvdWxkIGRlcGVuZCBvbgo+IHRob3NlIHRoZW4gKGFuZCB3aXRob3V0
IGhhdmluZyB0aG9zZSBpbiAgcmVkaXN0cmlidXRhYmxlIGZvcm0sIHRoZXJlCj4gaXNuJ3QgbXVj
aCB3ZSBjYW4gZG8gYWJvdXQgZXhjZXB0IGZpeGluZyBpdCBvbiB0aGUga2VybmVsIHNpZGUpLgo+
Cj4gPiA+ID4gICA1KSBOb3cgdGhlIGRyaXZlciB0aGlua3MgdGhlIEdQVSBpcyBhdCAyLjUgR1Qv
cyBidXQgaXQncyBhY3R1YWxseSBhdAo+ID4gPiA+ICAgICAgOC4wIEdUL3MuCj4gPiA+Cj4gPiA+
IHdoYXQgaXMgYWN0dWFsbHkgbWVhbnQgYnkgImRyaXZlciIgaGVyZT8gVGhlIHBjaSBzdWJzeXN0
ZW0gb3IgTm91dmVhdT8KPiA+Cj4gPiBJIHdhcyB0aGlua2luZyBOb3V2ZWF1IGJlY2F1c2UgdGhl
IFBDSSBjb3JlIGRvZXNuJ3QgY2FyZSBhYm91dCB0aGUKPiA+IGxpbmsgc3BlZWQuCj4gPgo+ID4g
PiA+IFdpdGhvdXQga25vd2luZyBtb3JlIGFib3V0IHRoZSB0cmFuc2l0aW9uIHRvIDIuNSBHVC9z
LCBJIGNhbid0IGd1ZXNzCj4gPiA+ID4gd2h5IHRoZSBHUFUgd291bGRuJ3Qgd29yayBhZnRlciBy
ZXN1bWUuICBGcm9tIGEgUENJZSBwb2ludCBvZiB2aWV3LAo+ID4gPiA+IHRoZSBsaW5rIGlzIHN1
cHBvc2VkIHRvIHdvcmsgYW5kIHRoZSBkZXZpY2Ugc2hvdWxkIGJlIHJlYWNoYWJsZQo+ID4gPiA+
IGluZGVwZW5kZW50IG9mIHRoZSBsaW5rIHNwZWVkLiAgQnV0IG1heWJlIHRoZXJlJ3Mgc29tZSB3
ZWlyZAo+ID4gPiA+IGRlcGVuZGVuY3kgYmV0d2VlbiB0aGUgR1BVIGFuZCB0aGUgZHJpdmVyIGhl
cmUuCj4gPiA+Cj4gPiA+IGJ1dCB0aGUgZGV2aWNlIGlzbid0IHJlYWNoYWJsZSBhdCBhbGwsIG5v
dCBldmVuIGZyb20gdGhlIHBjaQo+ID4gPiBzdWJzeXN0ZW0uIEFsbCByZWFkcyBmYWlsL3JldHVy
biBhIGRlZmF1bHQgZXJyb3IgdmFsdWUgKDB4ZmZmZmZmZmYpLgo+ID4KPiA+IEFyZSB0aGVzZSBQ
Q0kgY29uZmlnIHJlYWRzIHRoYXQgcmV0dXJuIDB4ZmZmZmZmZmY/ICBPciBNTUlPIHJlYWRzPwo+
ID4gImxzcGNpIC12dnh4eHgiIG9mIHRoZSBicmlkZ2UgYW5kIHRoZSBHUFUgbWlnaHQgaGF2ZSBh
IGNsdWUgYWJvdXQKPiA+IHdoZXRoZXIgYSBQQ0kgZXJyb3Igb2NjdXJyZWQuCj4gPgo+Cj4gdGhh
dCdzIGtpbmQgb2YgcHJvYmxlbWF0aWMgYXMgaXQgbWlnaHQganVzdCBsb2NrIHVwIG15IG1hY2hp
bmUuLi4gYnV0Cj4gbGV0IG1lIHRyeSB0aGF0Lgo+Cj4gPiA+ID4gSXQgc291bmRzIGxpa2UgdGhp
bmdzIHdvcmsgaWYgeW91IHJldHVybiB0byA4LjAgR1QvcyBiZWZvcmUgc3VzcGVuZCwKPiA+ID4g
PiB0aGluZ3Mgd29yay4gIFRoYXQgd291bGQgbWFrZSBzZW5zZSB0byBtZSBiZWNhdXNlIHRoZW4g
dGhlIGRyaXZlcidzCj4gPiA+ID4gaWRlYSBvZiB0aGUgbGluayBzdGF0ZSBhZnRlciByZXN1bWUg
d291bGQgbWF0Y2ggdGhlIGFjdHVhbCBzdGF0ZS4KPiA+ID4KPiA+ID4gZGVwZW5kcyBvbiB3aGF0
IGlzIG1lYW50IGJ5IHRoZSBkcml2ZXIgaGVyZS4gSW5zaWRlIE5vdXZlYXUgd2UgZG9uJ3QKPiA+
ID4gY2FyZSBvbmUgYml0IGFib3V0IHRoZSBjdXJyZW50IGxpbmsgc3BlZWQsIHNvIEkgYXNzdW1l
IHlvdSBtZWFuCj4gPiA+IHNvbWV0aGluZyBpbnNpZGUgdGhlIHBjaSBjb3JlIGNvZGU/Cj4gPiA+
Cj4gPiA+ID4gQnV0IEkgZG9uJ3Qgc2VlIGEgd2F5IHRvIGRlYWwgd2l0aCB0aGlzIGluIHRoZSBQ
Q0kgY29yZS4gIFRoZSBQQ0kgY29yZQo+ID4gPiA+IGRvZXMgc2F2ZSBhbmQgcmVzdG9yZSBtb3N0
IG9mIHRoZSBhcmNoaXRlY3RlZCBjb25maWcgc3BhY2UgYXJvdW5kCj4gPiA+ID4gc3VzcGVuZC9y
ZXN1bWUsIGJ1dCBzaW5jZSB0aGlzIGFwcGVhcnMgdG8gYmUgYSBkZXZpY2Utc3BlY2lmaWMgdGhp
bmcsCj4gPiA+ID4gdGhlIFBDSSBjb3JlIHdvdWxkIGhhdmUgbm8gaWRlYSBob3cgdG8gc2F2ZS9y
ZXN0b3JlIGl0Lgo+ID4gPgo+ID4gPiBpZiB3ZSBhc3N1bWUgdGhhdCB0aGUgbmVnb3RpYXRpb24g
b24gYSBkZXZpY2UgbGV2ZWwgd29ya3MgYXMgaW50ZW5kZWQsCj4gPiA+IHRoZW4gSSB3b3VsZCBl
eHBlY3QgdGhpcyB0byBiZSBhIHBjaSBjb3JlIGlzc3VlLCB3aGljaCBtaWdodCBhY3R1YWxseQo+
ID4gPiBiZSBub3QgZml4YWJsZSB0aGVyZS4gQnV0IGlmIGl0J3Mgbm90LCB0aGVuIHdlIHdvdWxk
IGhhdmUgdG8gcHV0Cj4gPiA+IHNvbWV0aGluZyBsaWtlIHRoYXQgaW5zaWRlIHRoZSBydW5wbSBk
b2N1bWVudGF0aW9uIHRvIHRlbGwgZHJpdmVycwo+ID4gPiB0aGV5IGhhdmUgdG8gZG8gc29tZXRo
aW5nIGFib3V0IGl0Lgo+ID4gPmxzcGNpIC12dnh4eHgKPiA+ID4gQnV0IGFnYWluLCBmb3IgbWUg
aXQganVzdCBzb3VuZHMgbGlrZSB0aGUgbmVnb3RpYXRpb24gb24gdGhlIGRldmljZQo+ID4gPiBs
ZXZlbCBmYWlscyBvciBzb21ldGhpbmcgaW5zaWRlIHBjaSBjb3JlIG1lc3NlcyBpdCB1cC4KPiA+
Cj4gPiBUbyBtZSBpdCBzb3VuZHMgbGlrZSB0aGUgUE1VIHNjcmlwdCBtZXNzZWQgc29tZXRoaW5n
IHVwLCBhbmQgdGhlIFBDSQo+ID4gY29yZSBoYXMgbm8gd2F5IHRvIGtub3cgd2hhdCB0aGF0IHdh
cyBvciBob3cgdG8gZml4IGl0Lgo+ID4KPgo+IHN1cmUsIEkgYW0gbWFpbmx5IHdvbmRlcmluZyB3
aHkgaXQgZG9lc24ndCB3b3JrIGFmdGVyIHdlIHBvd2VyIGN5Y2xlZAo+IHRoZSBHUFUgYW5kIHRo
ZSBob3N0IGJyaWRnZSBjb250cm9sbGVyLCBiZWNhdXNlIG5vIG1hdHRlciB3aGF0IHRoZQo+IHN0
YXRlIHdhcyBiZWZvcmUsIHdlIGhhdmUgdG8gcmVwcm9iZSBpbnN0ZWFkIG9mIHJlbHlpbmcgb24g
YSBrbm93bgo+IHN0YXRlLCBubz8KPgo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEthcm9s
IEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
PiA+ICBkcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oIHwgIDUgKysrLS0KPiA+
ID4gPiA+ID4gPiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2Jhc2UuYyAgICB8ICA5ICsr
KysrKystLQo+ID4gPiA+ID4gPiA+ICBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5j
ICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKystLS0tCj4gPiA+ID4gPiA+ID4gIGRybS9ub3V2
ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmggICAgfCAgMiArKwo+ID4gPiA+ID4gPiA+ICA0IGZp
bGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1
YmRldi9wY2kuaCBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKPiA+ID4g
PiA+ID4gPiBpbmRleCAxZmRmMzA5OC4uYjIzNzkzYTIgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0t
IGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaAo+ID4gPiA+ID4gPiA+ICsr
KyBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKPiA+ID4gPiA+ID4gPiBA
QCAtMjYsOCArMjYsOSBAQCBzdHJ1Y3QgbnZrbV9wY2kgewo+ID4gPiA+ID4gPiA+ICAgICAgIH0g
YWdwOwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gICAgICAgc3RydWN0IHsKPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgIGVudW0gbnZrbV9wY2llX3NwZWVkIHNwZWVkOwo+ID4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgdTggd2lkdGg7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBl
bnVtIG52a21fcGNpZV9zcGVlZCBjdXJfc3BlZWQ7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICBlbnVtIG52a21fcGNpZV9zcGVlZCBkZWZfc3BlZWQ7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICB1OCBjdXJfd2lkdGg7Cj4gPiA+ID4gPiA+ID4gICAgICAgfSBwY2llOwo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gICAgICAgYm9vbCBtc2k7Cj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9iYXNlLmMgYi9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvYmFzZS5jCj4gPiA+ID4gPiA+ID4gaW5kZXggZWUyNDMxYTcuLmQ5ZmI1YTgz
IDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9i
YXNlLmMKPiA+ID4gPiA+ID4gPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvYmFz
ZS5jCj4gPiA+ID4gPiA+ID4gQEAgLTkwLDYgKzkwLDggQEAgbnZrbV9wY2lfZmluaShzdHJ1Y3Qg
bnZrbV9zdWJkZXYgKnN1YmRldiwgYm9vbCBzdXNwZW5kKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gICAgICAgaWYgKHBjaS0+YWdwLmJyaWRnZSkKPiA+ID4gPiA+ID4gPiAgICAgICAgICAg
ICAgIG52a21fYWdwX2ZpbmkocGNpKTsKPiA+ID4gPiA+ID4gPiArICAgICBlbHNlIGlmIChwY2lf
aXNfcGNpZShwY2ktPnBkZXYpKQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgbnZrbV9wY2ll
X2ZpbmkocGNpKTsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAgICAgIHJldHVybiAwOwo+
ID4gPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPiA+ID4gQEAgLTEwMCw2ICsxMDIsOCBAQCBudmttX3Bj
aV9wcmVpbml0KHN0cnVjdCBudmttX3N1YmRldiAqc3ViZGV2KQo+ID4gPiA+ID4gPiA+ICAgICAg
IHN0cnVjdCBudmttX3BjaSAqcGNpID0gbnZrbV9wY2koc3ViZGV2KTsKPiA+ID4gPiA+ID4gPiAg
ICAgICBpZiAocGNpLT5hZ3AuYnJpZGdlKQo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgbnZr
bV9hZ3BfcHJlaW5pdChwY2kpOwo+ID4gPiA+ID4gPiA+ICsgICAgIGVsc2UgaWYgKHBjaV9pc19w
Y2llKHBjaS0+cGRldikpCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBudmttX3BjaWVfcHJl
aW5pdChwY2kpOwo+ID4gPiA+ID4gPiA+ICAgICAgIHJldHVybiAwOwo+ID4gPiA+ID4gPiA+ICB9
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBAQCAtMTkzLDggKzE5Nyw5IEBAIG52a21fcGNp
X25ld18oY29uc3Qgc3RydWN0IG52a21fcGNpX2Z1bmMgKmZ1bmMsIHN0cnVjdCBudmttX2Rldmlj
ZSAqZGV2aWNlLAo+ID4gPiA+ID4gPiA+ICAgICAgIHBjaS0+ZnVuYyA9IGZ1bmM7Cj4gPiA+ID4g
PiA+ID4gICAgICAgcGNpLT5wZGV2ID0gZGV2aWNlLT5mdW5jLT5wY2koZGV2aWNlKS0+cGRldjsK
PiA+ID4gPiA+ID4gPiAgICAgICBwY2ktPmlycSA9IC0xOwo+ID4gPiA+ID4gPiA+IC0gICAgIHBj
aS0+cGNpZS5zcGVlZCA9IC0xOwo+ID4gPiA+ID4gPiA+IC0gICAgIHBjaS0+cGNpZS53aWR0aCA9
IC0xOwo+ID4gPiA+ID4gPiA+ICsgICAgIHBjaS0+cGNpZS5jdXJfc3BlZWQgPSAtMTsKPiA+ID4g
PiA+ID4gPiArICAgICBwY2ktPnBjaWUuZGVmX3NwZWVkID0gLTE7Cj4gPiA+ID4gPiA+ID4gKyAg
ICAgcGNpLT5wY2llLmN1cl93aWR0aCA9IC0xOwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
ICAgICAgaWYgKGRldmljZS0+dHlwZSA9PSBOVktNX0RFVklDRV9BR1ApCj4gPiA+ID4gPiA+ID4g
ICAgICAgICAgICAgICBudmttX2FncF9jdG9yKHBjaSk7Cj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2llLmMgYi9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvcGNpZS5jCj4gPiA+ID4gPiA+ID4gaW5kZXggNzBjY2JlMGQuLjczMWRkMzBl
IDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9w
Y2llLmMKPiA+ID4gPiA+ID4gPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNp
ZS5jCj4gPiA+ID4gPiA+ID4gQEAgLTg1LDYgKzg1LDEzIEBAIG52a21fcGNpZV9vbmVpbml0KHN0
cnVjdCBudmttX3BjaSAqcGNpKQo+ID4gPiA+ID4gPiA+ICAgICAgIHJldHVybiAwOwo+ID4gPiA+
ID4gPiA+ICB9Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAraW50Cj4gPiA+ID4gPiA+ID4g
K252a21fcGNpZV9wcmVpbml0KHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ID4gPiA+ID4gPiA+ICt7
Cj4gPiA+ID4gPiA+ID4gKyAgICAgcGNpLT5wY2llLmRlZl9zcGVlZCA9IG52a21fcGNpZV9nZXRf
c3BlZWQocGNpKTsKPiA+ID4gPiA+ID4gPiArICAgICByZXR1cm4gMDsKPiA+ID4gPiA+ID4gPiAr
fQo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiAgaW50Cj4gPiA+ID4gPiA+ID4gIG52a21f
cGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ID4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4g
PiA+ID4gQEAgLTEwNSwxMiArMTEyLDIxIEBAIG52a21fcGNpZV9pbml0KHN0cnVjdCBudmttX3Bj
aSAqcGNpKQo+ID4gPiA+ID4gPiA+ICAgICAgIGlmIChwY2ktPmZ1bmMtPnBjaWUuaW5pdCkKPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgIHBjaS0+ZnVuYy0+cGNpZS5pbml0KHBjaSk7Cj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAtICAgICBpZiAocGNpLT5wY2llLnNwZWVkICE9IC0xKQo+
ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgbnZrbV9wY2llX3NldF9saW5rKHBjaSwgcGNpLT5w
Y2llLnNwZWVkLCBwY2ktPnBjaWUud2lkdGgpOwo+ID4gPiA+ID4gPiA+ICsgICAgIGlmIChwY2kt
PnBjaWUuY3VyX3NwZWVkICE9IC0xKQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgbnZrbV9w
Y2llX3NldF9saW5rKHBjaSwgcGNpLT5wY2llLmN1cl9zcGVlZCwKPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2ktPnBjaWUuY3VyX3dpZHRoKTsKPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAgICAgIHJldHVybiAwOwo+ID4gPiA+ID4gPiA+ICB9Cj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAraW50Cj4gPiA+ID4gPiA+ID4gK252a21fcGNpZV9m
aW5pKHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ID4g
KyAgICAgaWYgKCFJU19FUlJfVkFMVUUocGNpLT5wY2llLmRlZl9zcGVlZCkpCj4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICByZXR1cm4gbnZrbV9wY2llX3NldF9saW5rKHBjaSwgcGNpLT5wY2ll
LmRlZl9zcGVlZCwgMTYpOwo+ID4gPiA+ID4gPiA+ICsgICAgIHJldHVybiAwOwo+ID4gPiA+ID4g
PiA+ICt9Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICBpbnQKPiA+ID4gPiA+ID4gPiAg
bnZrbV9wY2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVtIG52a21fcGNpZV9z
cGVlZCBzcGVlZCwgdTggd2lkdGgpCj4gPiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ID4gPiBAQCAt
MTQ2LDggKzE2Miw4IEBAIG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwg
ZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQo+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgc3BlZWQgPSBtYXhfc3BlZWQ7Cj4gPiA+ID4gPiA+ID4gICAgICAgfQo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gLSAgICAgcGNpLT5wY2llLnNwZWVkID0gc3BlZWQ7Cj4gPiA+
ID4gPiA+ID4gLSAgICAgcGNpLT5wY2llLndpZHRoID0gd2lkdGg7Cj4gPiA+ID4gPiA+ID4gKyAg
ICAgcGNpLT5wY2llLmN1cl9zcGVlZCA9IHNwZWVkOwo+ID4gPiA+ID4gPiA+ICsgICAgIHBjaS0+
cGNpZS5jdXJfd2lkdGggPSB3aWR0aDsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAgICAg
IGlmIChzcGVlZCA9PSBjdXJfc3BlZWQpIHsKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgIG52
a21fZGVidWcoc3ViZGV2LCAicmVxdWVzdGVkIG1hdGNoZXMgY3VycmVudCBzcGVlZFxuIik7Cj4g
PiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2
LmggYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oCj4gPiA+ID4gPiA+ID4gaW5k
ZXggYTBkNGMwMDcuLmU3NzQ0NjcxIDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmgKPiA+ID4gPiA+ID4gPiArKysgYi9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvcHJpdi5oCj4gPiA+ID4gPiA+ID4gQEAgLTYwLDUgKzYwLDcgQEAg
ZW51bSBudmttX3BjaWVfc3BlZWQgZ2sxMDRfcGNpZV9tYXhfc3BlZWQoc3RydWN0IG52a21fcGNp
ICopOwo+ID4gPiA+ID4gPiA+ICBpbnQgZ2sxMDRfcGNpZV92ZXJzaW9uX3N1cHBvcnRlZChzdHJ1
Y3QgbnZrbV9wY2kgKik7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgaW50IG52a21fcGNp
ZV9vbmVpbml0KHN0cnVjdCBudmttX3BjaSAqKTsKPiA+ID4gPiA+ID4gPiAraW50IG52a21fcGNp
ZV9wcmVpbml0KHN0cnVjdCBudmttX3BjaSAqKTsKPiA+ID4gPiA+ID4gPiAgaW50IG52a21fcGNp
ZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKPiA+ID4gPiA+ID4gPiAraW50IG52a21fcGNpZV9m
aW5pKHN0cnVjdCBudmttX3BjaSAqKTsKPiA+ID4gPiA+ID4gPiAgI2VuZGlmCj4gPiA+ID4gPiA+
ID4gLS0KPiA+ID4gPiA+ID4gPiAyLjIxLjAKPiA+ID4gPiA+ID4gPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
