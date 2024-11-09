import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "timer" ]

    connect() {
        if (this.hasTimerTarget) {
            this.startTimer()
        }
    }

    startTimer() {
        this.timerInterval = setInterval(() => {
            const startTime = new Date(this.timerTarget.dataset.startTime)
            const duration = this.calculateDuration(startTime)
            this.timerTarget.textContent = this.formatDuration(duration)
        }, 1000)
    }

    disconnect() {
        if (this.timerInterval) {
            clearInterval(this.timerInterval)
        }
    }

    calculateDuration(startTime) {
        return Math.floor((new Date() - startTime) / 1000)
    }

    formatDuration(seconds) {
        const hours = Math.floor(seconds / 3600)
        const minutes = Math.floor((seconds % 3600) / 60)
        const remainingSeconds = seconds % 60

        return `${hours}:${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`
    }
}