Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D5269B6C
	for <lists+nouveau@lfdr.de>; Tue, 15 Sep 2020 03:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017D96E094;
	Tue, 15 Sep 2020 01:45:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5809F6E094
 for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2020 01:44:59 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id y190so1031688vsy.1
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 18:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k2QAtlQ4NeQ395l+iKTPCUiQh9i/pgoie3Hj+lWTgQ8=;
 b=UPAmQH2xb5S87HWGmu2LCXxfrihAbRUILTmVaYmqwNMBe4TEM4xRQSjO6jayxyUQGO
 EGJx5fBd8R5ULmDxgWLciX4s/fzgrRtKiB7HNTrS8GCS44SM2TsAd03kaguNNV5stcog
 MmnDzEwC5C78rY594KBRV2rdJXot/+WaqqkHFjCf/EzoIDATN218YKmgM/ukVuuBpY64
 Bh8hT0czFldgEpS+SWISBwiSH2+jf3OPVEs9AND27N0XxJMu/xiKrXzAaonw6snn6dA8
 /kbDlBPMlZwLCloi1bT8AKD8etpEUeONp5dqTjrSZa3z6eYWsLl/L+3I0YzIEwmwnz7M
 b87A==
X-Gm-Message-State: AOAM531irlSIi8Vb5QVAvx/K4vHLT4ntXJlyONkSHIhP1BGSbpqKRzJx
 YVjBv5btpYx8Vu68onbx6OhCKEbQxhZX6VWtcHY=
X-Google-Smtp-Source: ABdhPJyQOU8j/PCu+JvxCUPks+oSt0TfipJ1dzI3af+Q87voltNMophDYxgh2ApWYGMyz2k8NitdIJYmvsKFjW5nOw0=
X-Received: by 2002:a67:6952:: with SMTP id e79mr9148382vsc.11.1600134298147; 
 Mon, 14 Sep 2020 18:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <CABB28CwNaHhCdKZio-GoGWcmTyZ-B33zwnmMmhQ9JLy8EjhC-Q@mail.gmail.com>
 <CAKb7UvgjzfaOaHb+N-h6iRpDR5YBBRx5z88J2m5uPzNARnpiHQ@mail.gmail.com>
 <CABB28CwK0RRz=5SpHM2Ne_dHpZyD5oCvj9rwOBLHU4wueT3kWw@mail.gmail.com>
In-Reply-To: <CABB28CwK0RRz=5SpHM2Ne_dHpZyD5oCvj9rwOBLHU4wueT3kWw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Sep 2020 21:44:47 -0400
Message-ID: <CAKb7UvhvzRZrVTANKzsJT8d6RDy2vcQGbqujTYZFkReb2TRSEg@mail.gmail.com>
To: =?UTF-8?Q?Tomasz_K=C5=82oczko?= <kloczko.tomasz@gmail.com>
Subject: Re: [Nouveau] libva-utils test siuite is crashing in nouveau sriver
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMTMsIDIwMjAgYXQgNTowMSBQTSBUb21hc3ogS8WCb2N6a28gPGtsb2N6a28u
dG9tYXN6QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIFN1biwgMTMgU2VwIDIwMjAgYXQgMjA6
MzUsIElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4+Cj4+IFdoYXQg
aGFyZHdhcmUgYXJlIHlvdSB1c2luZz8KPgo+Cj4gMDAwMDoxODowMC4wIFZHQSBjb21wYXRpYmxl
IGNvbnRyb2xsZXI6IE5WSURJQSBDb3Jwb3JhdGlvbiBHUDEwNEdMIFtRdWFkcm8gUDQwMDBdIChy
ZXYgYTEpCgpUaGVyZSdzIG5vIGFjY2VsZXJhdGlvbiBzdXBwb3J0IGZvciB2aWRlbyBkZWNvZGlu
ZyBwYXN0IEtlcGxlci4gRldJVyBJCmRvbid0IGdldCBhIGNyYXNoIHdpdGggYSBHUDEwOCB3aGVu
IHJ1bm5pbmcgdmFpbmZvOgoKJCB2YWluZm8KbGlidmEgaW5mbzogVkEtQVBJIHZlcnNpb24gMS44
LjAKbGlidmEgaW5mbzogVHJ5aW5nIHRvIG9wZW4gL3Vzci9saWI2NC92YS9kcml2ZXJzL25vdXZl
YXVfZHJ2X3ZpZGVvLnNvCmxpYnZhIGluZm86IHZhX29wZW5Ecml2ZXIoKSByZXR1cm5zIC0xCnZh
SW5pdGlhbGl6ZSBmYWlsZWQgd2l0aCBlcnJvciBjb2RlIC0xICh1bmtub3duIGxpYnZhIGVycm9y
KSxleGl0Cgp3aXRoIE1lc2EgMjAuMi4wLXJjMi4gTm90IHN1cmUgaWYgeW91ciBpc3N1ZSBoYXMg
YmVlbiBmaXhlZCAoYW5kIG5vdwppdCBlcnJvcnMpLCBvciBpZiB5b3UncmUgaGl0dGluZyBzb21l
dGhpbmcgZWxzZS4gRWl0aGVyIHdheSwgbW9zdApsaWtlbHkgYW4gaXNzdWUgd2l0aCB0aGUgY29t
bW9uIGNvZGUgaWYgaXQgaW5kZWVkIHBlcnNpc3RzLgoKQ2hlZXJzLAoKICAtaWxpYQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
