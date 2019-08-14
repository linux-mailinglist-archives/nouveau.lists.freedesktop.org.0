Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC590D3F
	for <lists+nouveau@lfdr.de>; Sat, 17 Aug 2019 07:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FD56E9D9;
	Sat, 17 Aug 2019 05:45:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0606E873
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 23:35:03 +0000 (UTC)
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <alex.hung@canonical.com>)
 id 1hy2nF-0008WD-Ho
 for nouveau@lists.freedesktop.org; Wed, 14 Aug 2019 23:35:01 +0000
Received: by mail-qt1-f199.google.com with SMTP id k13so833526qtp.15
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 16:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VyFhDO1eWcBeMeihOWCBNHAWrS5d5d9jzD5/Lieum7w=;
 b=OvspWM+WgXIC+eDl9iJCavSJqTA0/Iph0OhCA68F+AGiV+VDFB+RuyDhQ+f3TZZI0x
 Irhd7/w75HFfvmUHiQ+GCVONWl1LnvbD9soBv+B1WYVHREKujl0wd8z7CuYbxYCEo+aE
 1lW9ravXEMwabFrjSgk1vNGnovHYcZo/EQSSFAcHA5uFoUuPnPk7TusiMDIUqMXqWQc9
 eA30iXSe3/O5ZvZDsCh7NNdaY0yOKDR/l6HIfdaBoHA550q6SdFUGg7kVY+HrLFJnknJ
 mDuIkGxEo3y4DUVzIR1v3Fn+dlV/kH9vzBfKjgQso71L0PWrw0PGVU8vXEsq8ylQlaLF
 L+0w==
X-Gm-Message-State: APjAAAWjOvDzmvtF2f/D0HZiwbMSVG4hrfS5DOicQrxwq7/4c1w6oNK/
 fdNlQV194srKejKe8HPBYCgqjQOldGyRqihT7mAFUK14LBzsPWSlyoZUL3MusndHI70NH7r71U2
 fsmSYK3Hp2pCHOYI1GH7bTY9W+m3IEaE2A5p5OWKrjwluh/FEt563AT1s5L4=
X-Received: by 2002:a0c:f6ce:: with SMTP id d14mr1525096qvo.56.1565825700753; 
 Wed, 14 Aug 2019 16:35:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxE+6MV13gPzPrDixW9IwdnT+USgnWkWtGUiu6QcUgWCmd75vba/3ZYWWy4K18nZ+ZMC4zhsyMCvvjKOohDSj4=
X-Received: by 2002:a0c:f6ce:: with SMTP id d14mr1525085qvo.56.1565825700594; 
 Wed, 14 Aug 2019 16:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-4-kherbst@redhat.com>
In-Reply-To: <20190814213118.28473-4-kherbst@redhat.com>
From: Alex Hung <alex.hung@canonical.com>
Date: Wed, 14 Aug 2019 17:34:49 -0600
Message-ID: <CAJ=jquaVcWisQ3Qw-_GMktcOq4zqFmeYXztfwNAVKZJO=_+yLA@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 05:45:39 +0000
Subject: Re: [Nouveau] [PATCH 3/7] Revert "ACPI / OSI: Add OEM _OSI strings
 to disable NVidia RTD3"
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
Cc: nouveau@lists.freedesktop.org,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMzozMSBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHJldmVydHMgY29tbWl0IDkyNTFhNzFkYjYyY2E5Y2M3
ZTdjZjM2NDIxODYxMGIwZjAxOGMyOTEuCj4KPiBUaGlzIHdhcyBuZXZlciBkaXNjdXNzZWQgd2l0
aCBhbnlib2R5IE5vdXZlYXUgcmVsYXRlZCBhbmQgd2Ugd291bGQgaGF2ZSBOQUNLZWQKPiB0aGlz
IGNoYW5nZSBpbW1lZGlhdGVseS4KPgo+IFdlIGhhdmUgYSBiZXR0ZXIgd29ya2Fyb3VuZCwgd2hp
Y2ggbWFrZXMgaXQgYWN0dWFsbHkgd29yayB3aXRoIE5vdXZlYXUuIE5vIGlkZWEKPiB3aHkgdGhl
IGNvbW1lbnQgbWVudGlvbnMgdGhlIE52aWRpYSBkcml2ZXIgYW5kIGFzc3VtZXMgaXQgZ2l2ZXMg
YW55IHdlaWdodCB0bwo+IHRoZSByZWFzb25pbmcuLi4uIHdlIGRvbid0IGNhcmUgYWJvdXQgb3V0
IG9mIHRyZWUgZHJpdmVycy4KPgo+IE5vdXZlYXUgZG9lcyBzdXBwb3J0IFJURDMsIGJ1dCB3ZSBo
YWQgc29tZSBpc3N1ZXMgd2l0aCB0aGF0LiBBbmQgd2UgZXZlbiBoYXZlCj4gYSBiZXR0ZXIgZml4
IGZvciB0aGlzIGlzc3VlLiBBbHNvLCBjYW4gd2UgX3BsZWFzZV8gZG8gaXQgaW4gYSB3YXkgd29y
dGh5IG9mIGFuCj4gdXBzdHJlYW0gY29tbXVuaXR5IHRoZSBuZXh0IHRpbWU/Cj4KPiBJZiBzb21l
IGRpc3RyaWJ1dGlvbiBmZWVscyBsaWtlIHRoZXkgaGF2ZSB0byBwbGVhc2UgY29tcGFuaWVzIG5v
dCB3YW50aW5nIHRvCj4gYmUgcGFydCBvZiB0aGUgbGludXggY29tbXVuaXR5LCBwbGVhc2UgZG8g
c28gZG93bnN0cmVhbSBhbmQgZG9uJ3QgdHJ5IHRvIHB1c2gKPiBzb21ldGhpbmcgbGlrZSB0aGlz
IHVwc3RyZWFtLgoKSGkgS2Fyb2wsCgpBIGxvdCBvZiBhcHByZWNpYXRpb24gZm9yIHlvdXIgaGFy
ZC13b3JrIG9uIHRoaXMgaXNzdWUsIGJ1dCB1bmZyaWVuZGx5CmNvbW1lbnRzIGFyZW4ndCBuZWNl
c3NhcnkuIEF0IHRoZSB0aW1lIHRoaXMgd2FzIGRpc2N1c3NlZCB3aXRoCmhhcmR3YXJlIHZlbmRv
cnMgYW5kIHBsYXRmb3JtIHZlbmRvcnMgYW5kIGl0IHdvcmtlZCBmb3IgbWFueSBzeXN0ZW1zCmFu
ZCBiZW5lZml0IGZvciBtYW55IHBlb3BsZSBidXlpbmcgdGhlc2UgcGxhdGZvcm1zLiBMYXN0IGJ1
dCBub3QKbGVhc3QsIEkgZG8gYXBwcmVjaWF0ZSBiZXR0ZXIgZml4ZXMgYW5kIHdhbnQgdG8gcmV0
aXJlIHRoZSBoYWNrcyB0b28uCgpJIGFtIGdvaW5nIHRvIG5vdGlmeSBoYXJkd2FyZSBvd25lcnMg
dG8gdGVzdCB0aGVzZSBwYXRjaGVzIG9uIHRoZQpvcmlnaW5hbCBpbnRlbmRlZCBzeXN0ZW1zLCBh
bmQgd2lsbCByZXBvcnQgd2hldGhlciB0aGVyZSBhcmUKcmVncmVzc2lvbnMuCgoKPgo+IFNpZ25l
ZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgo+IENDOiBBbGV4IEh1
bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgo+IENDOiBSYWZhZWwgSi4gV3lzb2NraSA8cmFm
YWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQ0M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+Cj4gQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ0M6IEJlbiBTa2Vn
Z3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL29zaS5jIHwgOSAt
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9hY3BpL29zaS5jIGIvZHJpdmVycy9hY3BpL29zaS5jCj4gaW5kZXggNTZjYzk1
YjZiNzI0Li5mNWQ1NTlhMmZmMTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL29zaS5jCj4g
KysrIGIvZHJpdmVycy9hY3BpL29zaS5jCj4gQEAgLTQ0LDE1ICs0NCw2IEBAIG9zaV9zZXR1cF9l
bnRyaWVzW09TSV9TVFJJTkdfRU5UUklFU19NQVhdIF9faW5pdGRhdGEgPSB7Cj4gICAgICAgICB7
IlByb2Nlc3NvciBEZXZpY2UiLCB0cnVlfSwKPiAgICAgICAgIHsiMy4wIF9TQ1AgRXh0ZW5zaW9u
cyIsIHRydWV9LAo+ICAgICAgICAgeyJQcm9jZXNzb3IgQWdncmVnYXRvciBEZXZpY2UiLCB0cnVl
fSwKPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBMaW51eC1EZWxsLVZpZGVvIGlzIHVzZWQgYnkg
QklPUyB0byBkaXNhYmxlIFJURDMgZm9yIE5WaWRpYSBncmFwaGljcwo+IC0gICAgICAgICogY2Fy
ZHMgYXMgUlREMyBpcyBub3Qgc3VwcG9ydGVkIGJ5IGRyaXZlcnMgbm93LiAgU3lzdGVtcyB3aXRo
IE5WaWRpYQo+IC0gICAgICAgICogY2FyZHMgd2lsbCBoYW5nIHdpdGhvdXQgUlREMyBkaXNhYmxl
ZC4KPiAtICAgICAgICAqCj4gLSAgICAgICAgKiBPbmNlIE5WaWRpYSBkcml2ZXJzIG9mZmljaWFs
bHkgc3VwcG9ydCBSVEQzLCB0aGlzIF9PU0kgc3RyaW5ncyBjYW4KPiAtICAgICAgICAqIGJlIHJl
bW92ZWQgaWYgYm90aCBuZXcgYW5kIG9sZCBncmFwaGljcyBjYXJkcyBhcmUgc3VwcG9ydGVkLgo+
IC0gICAgICAgICovCj4gLSAgICAgICB7IkxpbnV4LURlbGwtVmlkZW8iLCB0cnVlfSwKPiAgfTsK
Pgo+ICBzdGF0aWMgdTMyIGFjcGlfb3NpX2hhbmRsZXIoYWNwaV9zdHJpbmcgaW50ZXJmYWNlLCB1
MzIgc3VwcG9ydGVkKQo+IC0tCj4gMi4yMS4wCj4KCgotLQpDaGVlcnMsCkFsZXggSHVuZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
